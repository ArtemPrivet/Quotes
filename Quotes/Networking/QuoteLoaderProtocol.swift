//
//  QuoteLoaderProtocol.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import Foundation

protocol QuoteLoaderProtocol: ObservableObject {
    var quote: QuoteModel? { get }

    func loadQuote()
}
