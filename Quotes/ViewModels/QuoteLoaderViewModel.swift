//
//  QuoteLoaderViewModel.swift
//  Quotes
//
//  Created by Artem Orlov on 21.09.23.
//

import SwiftUI
import Combine

protocol QuoteLoaderViewModelProtocol: ObservableObject {
    var quote: QuoteModel? { get }
    var title: String { get }
    var shouldLoadQuote: Bool { get }
    var showLoading: Bool { get }

    func saveQuote()
    func reloadQuote()
}

class QuoteLoaderViewModel {
    private let loader: any QuoteLoaderProtocol
    @Published private(set) var quote: QuoteModel?
    @Published private(set) var title: String
    @Published var showLoading: Bool = false

    private var cancellables: Set<AnyCancellable> = []

    init(source: QuoteSourceModel) {
        switch source.source {
        case .kanye(let url):
            self.loader = QuoteLoader<KanyeQuoteModel>(url: url)
        case .quotable(let url):
            self.loader = QuoteLoader<[QuotableQuoteModel]>(url: url)
        case .breakingBad(let url):
            self.loader = QuoteLoader<[BreakingBadQuoteModel]>(url: url)
        }

        title = source.name

        loader.quotePublisher
            .sink { [weak self] value in
                self?.quote = value
            }
            .store(in: &cancellables)

        loader.isLoadingPublisher
            .sink { [weak self] isLoading in
                self?.showLoading = isLoading
            }
            .store(in: &cancellables)
    }

    deinit {
        print(self)
    }
}

extension QuoteLoaderViewModel: QuoteLoaderViewModelProtocol {
    var shouldLoadQuote: Bool {
        quote == nil
    }

    func saveQuote() {
        print("save quote: \(quote)")
    }

    func reloadQuote() {
        loader.loadQuote()
    }
}
