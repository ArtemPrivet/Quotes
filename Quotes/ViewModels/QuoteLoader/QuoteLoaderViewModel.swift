//
//  QuoteLoaderViewModel.swift
//  Quotes
//
//  Created by Artem Orlov on 21.09.23.
//

import SwiftUI
import Combine

protocol QuoteLoaderViewModelProtocol: ObservableObject {
    var quote: String { get }
    var title: String { get }
    var author: String { get }

    var shouldLoadQuote: Bool { get }
    var shouldShowAlert: Bool { get set }
    var showLoading: Bool { get }
    var errorMessage: String? { get }

    func saveQuote()
    func reloadQuote()
    func playQuote()
}

class QuoteLoaderViewModel {
    @Published private(set) var title: String
    @Published var showLoading: Bool = false
    // TODO: Show alert when try to save already saved quote
    @Published var shouldShowAlert: Bool = false
    var errorMessage: String?

    private let loader: any QuoteLoaderProtocol
    private var quoteModel: QuoteModel?
    private var cancellables: Set<AnyCancellable> = []
    private let speechRecognition: SpeechRecognitionProtocol
    private let storage = QuotesStorageService.shared

    init(
        quoteSource: QuoteSourceModel,
        speechRecognition: SpeechRecognitionProtocol
    ) {
        self.speechRecognition = speechRecognition
        switch quoteSource.source {
        case .kanye(let url):
            self.loader = QuoteLoader<KanyeQuoteModel>(url: url)
        case .quotable(let url):
            self.loader = QuoteLoader<[QuotableQuoteModel]>(url: url)
        case .breakingBad(let url):
            self.loader = QuoteLoader<[BreakingBadQuoteModel]>(url: url)
        case .local(let url):
            self.loader = QuoteLoader<LocalQuoteModel>(url: url)
        }

        title = quoteSource.name

        loader.quotePublisher
            .sink { [weak self] value in
                self?.quoteModel = value
            }
            .store(in: &cancellables)

        loader.isLoadingPublisher
            .sink { [weak self] isLoading in
                self?.showLoading = isLoading
            }
            .store(in: &cancellables)
    }
}

extension QuoteLoaderViewModel: QuoteLoaderViewModelProtocol {
    var shouldLoadQuote: Bool {
        quoteModel == nil
    }

    var quote: String {
        quoteModel?.quote ?? "Something went wrong"
    }

    var author: String {
        "–" + (quoteModel?.author ?? "Unknown")
    }

    func saveQuote() {
        guard let quote = quoteModel else { return }
        guard storage.checkIfAlreadyExist(quote: quote.quote) == false else {
            errorMessage = "This quote is saved already"
            shouldShowAlert = true
            return
        }
        storage
            .publisher { [weak self] in
                guard let self = self else { return }
                let quoteModel = QuoteDataModel(context: QuotesStorageService.shared.context)
                quoteModel.author = self.author
                quoteModel.quote = self.quote
                quoteModel.date = Date()
            }
            .sink { completion in
                if case .failure(let error) = completion {
                    print("CORE DATA ERROR ❌")
                    print(error.localizedDescription)
                }
            } receiveValue: { success in
                if success {
                    print("CORE DATA SAVED ✅")
                }
            }
            .store(in: &cancellables)
    }

    func reloadQuote() {
        loader.loadQuote()
    }

    func playQuote() {
        guard let quote = quoteModel else { return }
        speechRecognition.speak(text: quote.quote)
    }
}
