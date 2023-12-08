//
//  QuotesTabView.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import SwiftUI

struct QuotesTabView: View {
    @State private var tabSelection = 0

    var body: some View {
        TabView(selection: $tabSelection) {
            QuoteOfTheDayView()
                .tabItem {
                    Label(R.string.localizable.quote_of_the_day(), systemImage: "quote.bubble")
                }
                .tag(0)
            QuotesSourcesView()
                .tabItem {
                    Label(R.string.localizable.quotes(), systemImage: "quote.bubble")
                }
                .tag(1)
            FavouriteQuotesView(tabSelection: $tabSelection)
                .tabItem {
                    Label(R.string.localizable.favourites(), systemImage: "heart.square")
                }
                .tag(2)
            SettingsView()
                .tabItem {
                    Label(R.string.localizable.settings(), systemImage: "gear")
                }
                .tag(3)
        }
    }
}

struct QuotesTabView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesTabView()
    }
}
