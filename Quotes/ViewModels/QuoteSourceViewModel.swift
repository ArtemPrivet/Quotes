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
            QuoteSourceModel(name: "Kanye West", id: 0, imageName: "kanye", source: .kanye("https://api.kanye.rest")),
            QuoteSourceModel(name: "Quotable", id: 1, imageName: "quotable", source: .quotable("https://api.quotable.io/quotes/random")),
            QuoteSourceModel(name: "Kanye West", id: 2, imageName: "kanye", source: .kanye("https://api.kanye.rest")),
            QuoteSourceModel(name: "Kanye West", id: 3, imageName: "kanye", source: .kanye("https://api.kanye.rest")),
        ]
    }
}
