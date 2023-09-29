//
//  QuotesStorageService.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import CoreData
import Combine

protocol QuotesStorageServiceProtocol {
    var context: NSManagedObjectContext { get }
    func publisher(save action: @escaping Action) -> CoreDataSaveModelPublisher
    func publisher<T: NSManagedObject>(fetch request: NSFetchRequest<T>) -> CoreDataFetchResultsPublisher<T>
    func publisher(delete request: NSFetchRequest<NSFetchRequestResult>) -> CoreDataDeleteModelPublisher

    func checkIfAlreadyExist(quote: String) -> Bool
}

final class QuotesStorageService: QuotesStorageServiceProtocol {
    private let container: NSPersistentContainer

    static var shared: QuotesStorageServiceProtocol = {
        return QuotesStorageService(name: "QuotesData")
    }()

    var context: NSManagedObjectContext {
        container.viewContext
    }

    init(name: String) {
        self.container = NSPersistentContainer(name: name)
        self.container.loadPersistentStores { _, _ in }
    }

    func publisher(save action: @escaping Action) -> CoreDataSaveModelPublisher {
        return CoreDataSaveModelPublisher(action: action, context: context)
    }

    func publisher<T>(fetch request: NSFetchRequest<T>) -> CoreDataFetchResultsPublisher<T> where T : NSManagedObject {
        return CoreDataFetchResultsPublisher(request: request, context: context)
    }

    func publisher(delete request: NSFetchRequest<NSFetchRequestResult>) -> CoreDataDeleteModelPublisher {
        return CoreDataDeleteModelPublisher(delete: request, context: context)
    }

    func checkIfAlreadyExist(quote: String) -> Bool {
        let fetchRequest: NSFetchRequest<QuoteDataModel>
        fetchRequest = QuoteDataModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(
            format: "quote LIKE %@", quote
        )

        let objects = try? context.fetch(fetchRequest)

        return !(objects?.isEmpty ?? true)
    }
}
