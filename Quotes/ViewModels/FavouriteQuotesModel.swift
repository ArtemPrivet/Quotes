//
//  FavouriteQuotesModel.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import Foundation

class FavouriteQuotesModel: ObservableObject {
    @Published var quotes: [QuoteModel] = []

    init() {
//        quotes = QuotesStorageService.shared.quotes
//            .map { QuoteModel(quote: $0.quote ?? "", author: $0.author ?? "", image: $0.image ?? "") }
    }
}
