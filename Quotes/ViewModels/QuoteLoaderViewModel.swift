//
//  QuoteLoaderViewModel.swift
//  Quotes
//
//  Created by Artem Orlov on 21.09.23.
//

import SwiftUI
import Combine

protocol QuoteLoaderViewModelProtocol: ObservableObject {
    var quote: String? { get }
    var shouldLoadQuote: Bool { get }
    var showLoading: Bool { get }

    func saveQuote()
    func reloadQuote()
}

class QuoteLoaderViewModel<T: QuoteLoaderProtocol>: ObservableObject {
    @ObservedObject var loader: T
    @Published private(set) var quote: String?
    @Published var quoteModel: QuoteModel?
    @Published var showLoading: Bool = false

    private var cancellables: Set<AnyCancellable> = []

    init(loader: T) {
        self.loader = loader

        loader.quotePublisher
            .map { $0?.quote }
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
