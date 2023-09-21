//
//  KanyeWestQuoteLoader.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import Foundation
import Combine

final class KanyeWestQuoteLoader: QuoteLoaderProtocol {
    @Published var quote: QuoteModel?
    private var cancellables: Set<AnyCancellable> = []

    func loadQuote() {
        let url = URL(string: "https://api.kanye.rest")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: QuoteModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] quote in
                self?.quote = quote
            }
            .store(in: &cancellables)
    }
}
