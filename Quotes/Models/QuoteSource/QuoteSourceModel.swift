//
//  QuoteSourceModel.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import Foundation

struct QuoteSourceModel {
    let name: String
    let id: Int
    let imageName: String
    let source: QuoteSourceType
}

enum QuoteSourceType {
    case kanye(String)
    case quotable(String)
    case breakingBad(String)
}
