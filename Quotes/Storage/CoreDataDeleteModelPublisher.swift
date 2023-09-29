//
//  CoreDataDeleteModelPublisher.swift
//  Quotes
//
//  Created by Artem Orlov on 29.09.23.
//

import CoreData
import Combine

struct CoreDataDeleteModelPublisher: Publisher {
    typealias Output = NSBatchDeleteResult
    typealias Failure = Error

    private let request: NSFetchRequest<NSFetchRequestResult>
    private let context: NSManagedObjectContext

    init(delete request: NSFetchRequest<NSFetchRequestResult>, context: NSManagedObjectContext) {
        self.request = request
        self.context = context
    }

    func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
        let subscription = Subscription(subscriber: subscriber, context: context, request: request)
        subscriber.receive(subscription: subscription)
    }
}

extension CoreDataDeleteModelPublisher {
    class Subscription<S> where S : Subscriber, Failure == S.Failure, Output == S.Input {
        private var subscriber: S?
        private let request: NSFetchRequest<NSFetchRequestResult>
        private var context: NSManagedObjectContext

        init(subscriber: S, context: NSManagedObjectContext, request: NSFetchRequest<NSFetchRequestResult>) {
            self.subscriber = subscriber
            self.context = context
            self.request = request
        }
    }
}

extension CoreDataDeleteModelPublisher.Subscription: Subscription  {
    func request(_ demand: Subscribers.Demand) {
        var demand = demand
        guard let subscriber = subscriber, demand > 0 else { return }

        do {
            demand -= 1
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            deleteRequest.resultType = .resultTypeCount

            if let result = try context.execute(deleteRequest) as? NSBatchDeleteResult {
                demand += subscriber.receive(result)
            } else {
                subscriber.receive(completion: .failure(NSError()))
            }
        } catch {
            subscriber.receive(completion: .failure(error))
        }
    }

    func cancel() {
        subscriber = nil
    }
}
