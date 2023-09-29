//
//  FavouriteQuotesModel.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import CoreData
import Combine

class FavouriteQuotesModel: ObservableObject {
    @Published var quotes: [QuoteDataModel] = []

    private var cancellables: Set<AnyCancellable> = []
    private let storage =  QuotesStorageService.shared

    func delete(model: QuoteDataModel) {
        storage.context.delete(model)
    }
}
