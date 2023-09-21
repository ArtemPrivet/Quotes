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
            QuotesSourcesView()
                .tabItem {
                    Label("Quotes", systemImage: "quote.bubble")
                }
            QuotesSourcesView()
                .tabItem {
                    Label("Favourite", systemImage: "heart.square")
                }
            QuotesSourcesView()
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
