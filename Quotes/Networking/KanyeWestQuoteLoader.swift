//
//  KanyeWestQuoteLoader.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import Foundation
import Combine

final class KanyeWestQuoteLoader<T: Decodable>: QuoteLoaderProtocol {
    @Published private var quote: String?
    var quotePublisher: Published<String?>.Publisher { $quote }

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
                if let _quote = quote as? KanyeQuoteModel {
                    self?.quote = _quote.quote
                } else if let _quote = quote as? [QuotableQuoteModel] {
                    self?.quote = _quote.first?.content
                } else if let _quote = quote as? [BreakingBadQuoteModel] {
                    self?.quote = _quote.first?.quote
                } else {
                    self?.quote = nil
                }
            }
            .store(in: &cancellables)
    }
}
