//
//  QuotesStorageService.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import SwiftUI
import CoreData

final class QuotesStorageService: ObservableObject {
    @FetchRequest(entity: QuoteDataModel.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \QuoteDataModel.date, ascending: true)])
    var quotes: FetchedResults<QuoteDataModel>

    let container: NSPersistentContainer = NSPersistentContainer(name: "QuotesData")
    var context: NSManagedObjectContext { container.viewContext }

    static let shared = QuotesStorageService()

    private init(forPreview: Bool = false) {
        if forPreview {
            container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
        }
        container.loadPersistentStores { _, _ in }
        if forPreview {
            addMockData(moc: container.viewContext)
        }
    }

    func saveQuote(_ quote: QuoteModel) {
        let dataModel = QuoteDataModel(context: context)
        dataModel.quote = quote.quote
        dataModel.author = quote.author
        dataModel.image = quote.image
        dataModel.date = Date()

        do {
            try context.save()
        } catch {
            print("whoops \(error.localizedDescription)")
        }
    }

    func deleteQuote(_ quote: QuoteModel) {
        guard let quoteToDelete = quotes.first(where: { $0.quote == quote.quote }) else { return }
        context.delete(quoteToDelete)
        try? context.save()
    }

    private func addMockData(moc: NSManagedObjectContext) {
        let quote1 = QuoteDataModel(context: moc)
        quote1.quote = "This is the first quote"
        quote1.author = "Artem"

        let quote2 = QuoteDataModel(context: moc)
        quote2.quote = "This is the second quote"
        quote2.author = "Artem"

        let quote3 = QuoteDataModel(context: moc)
        quote3.quote = "This is the third big quote This is the third big quote This is the third big quote This is the third big quote"
        quote3.author = "Artem"
    }
}
