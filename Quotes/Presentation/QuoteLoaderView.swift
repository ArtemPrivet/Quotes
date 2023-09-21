//
//  QuoteLoaderView.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import SwiftUI
import Combine

struct QuoteLoaderView<T: QuoteLoaderProtocol>: View {
    @ObservedObject var loader: T

    init(loader: T) {
        self.loader = loader
    }

    var body: some View {
        VStack(spacing: 20) {
            Text(loader.quote?.quote ?? "No quote")
                .padding()

            Button("Reload") {
                loader.loadQuote()
            }
        }
        .onAppear {
            loader.loadQuote()
        }
    }
}

struct QuoteLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteLoaderView<KanyeWestQuoteLoader>(loader: KanyeWestQuoteLoader())
    }
}
