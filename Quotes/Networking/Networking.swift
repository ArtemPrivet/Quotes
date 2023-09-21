//
//  Networking.swift
//  Quotes
//
//  Created by Artem Orlov on 21.09.23.
//

import Foundation
import Combine

enum NetworkingError: Error {
    case wrongURL
}

final class Networking<T: Decodable> {
    func loadQuote(url: String) -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else { return Fail(error: NetworkingError.wrongURL).eraseToAnyPublisher() }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
