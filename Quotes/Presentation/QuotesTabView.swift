//
//  QuotesTabView.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import SwiftUI

struct QuotesTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Quotes", systemImage: "quote.bubble")
                }
            QuoteLoaderView(viewModel: QuoteLoaderViewModel(loader: KanyeWestQuoteLoader()))
                .tabItem {
                    Label("Favourite", systemImage: "heart.square")
                }
            ContentView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct QuotesTabView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesTabView()
    }
}
