//
//  QuotesStorageService.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import SwiftUI
import CoreData

final class QuotesStorageService: ObservableObject {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: QuoteDataModel.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \QuoteDataModel.date, ascending: true)])
    var quotes: FetchedResults<QuoteDataModel>

    let container: NSPersistentContainer = NSPersistentContainer(name: "QuotesData")

    static let shared = QuotesStorageService()

    private init() {
        container.loadPersistentStores { _, error in
            print(error)
        }
    }

    func saveQuote(_ quote: QuoteModel) {
        let dataModel = QuoteDataModel(context: moc)
        dataModel.quote = quote.quote
        dataModel.author = quote.author
        dataModel.image = quote.image
        dataModel.date = Date()

        do {
            try moc.save()
        } catch {
            print("whoops \(error.localizedDescription)")
        }
    }

    func deleteQuote(_ quote: QuoteModel) {
        guard let quoteToDelete = quotes.first(where: { $0.quote == quote.quote }) else { return }
        moc.delete(quoteToDelete)
        try? moc.save()
    }
}
