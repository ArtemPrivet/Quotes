//
//  QuoteSourceViewModel.swift
//  Quotes
//
//  Created by Artem Orlov on 21.09.23.
//

import Combine

protocol QuoteSourceViewModelProtocol: ObservableObject {
    var quoteSources: [QuoteSourceModel] { get }
    func getSources()
}

final class QuoteSourceViewModel {
    @Published var quoteSources: [QuoteSourceModel] = []
}

extension QuoteSourceViewModel: QuoteSourceViewModelProtocol {
    func getSources() {
        quoteSources = [
            QuoteSourceModel(name: R.string.localizable.random(), id: 0, imageName: R.image.question.name, source: .local("http://localhost:3000/random-quote")),
            QuoteSourceModel(name: "Kanye West", id: 1, imageName: R.image.kanye.name, source: .kanye("https://api.kanye.rest")),
            QuoteSourceModel(name: "Quotable", id: 2, imageName: R.image.quotable.name, source: .quotable("https://api.quotable.io/quotes/random")),
            QuoteSourceModel(name: "Breaking Bad", id: 3, imageName: R.image.breaking_bad.name, source: .breakingBad("https://api.breakingbadquotes.xyz/v1/quotes")),
        ]
    }
}
