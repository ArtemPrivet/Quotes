//
//  QuoteDataModel+CoreDataProperties.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//
//

import Foundation
import CoreData


extension QuoteDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuoteDataModel> {
        return NSFetchRequest<QuoteDataModel>(entityName: "QuoteDataModel")
    }

    @NSManaged public var quote: String?
    @NSManaged public var author: String?
    @NSManaged public var image: String?
    @NSManaged public var date: Date?

}

extension QuoteDataModel : Identifiable {
    var viewQuote: String {
        quote ?? "Quote is empty"
    }

    var viewAuthor: String {
        author ?? "Unknown"
    }
}
