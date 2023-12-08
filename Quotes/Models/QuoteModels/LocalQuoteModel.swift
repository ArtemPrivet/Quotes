//
//  LocalQuoteModel.swift
//  Quotes
//
//  Created by Artem Orlov on 07.12.23.
//

import Foundation

struct LocalQuoteModel: Decodable {
    let text: String
    let author: String
    let image: String
}
