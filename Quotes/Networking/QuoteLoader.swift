//
//  QuoteLoader.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import Foundation
import Combine

final class QuoteLoader<T: Decodable>: QuoteLoaderProtocol {
    @Published private var quote: QuoteModel?
    var quotePublisher: Published<QuoteModel?>.Publisher { $quote }

    @Published private var isLoading: Bool = false
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }

    private var cancellables: Set<AnyCancellable> = []
    private let url: String

    private let networking = Networking<T>()

    init(url: String) {
        self.url = url
    }

    func loadQuote() {
        isLoading = true
        
        networking.loadQuote(url: self.url)
            .sink { [weak self] completion in
                self?.isLoading = false
                print(completion)
            } receiveValue: { [weak self] quote in
                self?.quote = QuoteModel(model: quote)
            }
            .store(in: &cancellables)
    }
}
