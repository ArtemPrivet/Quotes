//
//  QuoteOfTheDayViewModel.swift
//  Quotes
//
//  Created by Artem Orlov on 07.12.23.
//

import Foundation
import Combine

final class QuoteOfTheDayViewModel: ObservableObject {
    @Published private(set) var text: String = "No quote yet"
    @Published private(set) var imageUrl: URL?

    private let networking = QuoteLoader<LocalQuoteModel>(url: "http://localhost:3000/quote-of-the-day")
    private var cancellables: Set<AnyCancellable> = []

    init() {
        networking.quotePublisher
            .sink { [weak self] value in
                guard let self = self else { return }
                self.text = self.createQuote(text: value?.quote, author: value?.author)
                self.imageUrl = URL(string: value?.image ?? "")
            }
            .store(in: &cancellables)

        networking.loadQuote()
    }

    private func createQuote(text: String?, author: String?) -> String {
        var quote = text ?? ""
        if let author = author {
            quote += "\n- \(author)"
        }
        return quote
    }
}
