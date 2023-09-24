//
//  QuoteModel.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import Foundation

struct QuoteModel {
    let quote: String
    let author: String
    let image: String?

    init(quote: String, author: String, image: String? = nil) {
        self.quote = quote
        self.author = author
        self.image = image
    }

    init?(model: Decodable) {
        switch model {
        case let model as KanyeQuoteModel:
            self = Self.init(quote: model.quote, author: "Kanye West")
        case let model as [QuotableQuoteModel]:
            guard let quotable = model.first else { return nil }
            self = Self.init(quote: quotable.content, author: "Unknown")
        case let model as [BreakingBadQuoteModel]:
            guard let breakingBad = model.first else { return nil }
            self = Self.init(quote: breakingBad.quote, author: breakingBad.author)
        default:
            return nil
        }
    }
}
