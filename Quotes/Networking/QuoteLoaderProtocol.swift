//
//  QuoteLoaderProtocol.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import Foundation

protocol QuoteLoaderProtocol: ObservableObject {
    var quotePublisher: Published<String?>.Publisher { get }
    var isLoadingPublisher: Published<Bool>.Publisher { get }

    func loadQuote()
}
