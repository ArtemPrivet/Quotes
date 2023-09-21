//
//  KanyeWestQuoteLoader.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import Foundation
import Combine

final class KanyeWestQuoteLoader: QuoteLoaderProtocol {
    @Published private var quote: QuoteModel?
    var quotePublisher: Published<QuoteModel?>.Publisher { $quote }

    @Published private var isLoading: Bool = false
    var isLoadingPublisher: Published<Bool>.Publisher { $isLoading }

    private var cancellables: Set<AnyCancellable> = []
    private let url = URL(string: "https://api.kanye.rest")!


    func loadQuote() {
        isLoading = true
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: QuoteModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                print(completion)
            } receiveValue: { [weak self] quote in
                self?.quote = quote
            }
            .store(in: &cancellables)
    }
}
