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
            QuotesSourcesView()
                .tabItem {
                    Label(R.string.localizable.quotes(), systemImage: "quote.bubble")
                }
                .tag(0)
            FavouriteQuotesView(tabSelection: $tabSelection)
                .tabItem {
                    Label(R.string.localizable.favorites(), systemImage: "heart.square")
                }
                .tag(1)
            SettingsView()
                .tabItem {
                    Label(R.string.localizable.settings(), systemImage: "gear")
                }
                .tag(2)
        }
    }
}

struct QuotesTabView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesTabView()
    }
}
