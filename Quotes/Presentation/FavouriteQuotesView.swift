//
//  FavouriteQuotesView.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import SwiftUI

struct FavouriteQuotesView: View {
    @Binding var tabSelection: Int

    var body: some View {
        NavigationView {
            QuotesEmptyView(bodyText: "You have no favourite quotes", tabSelection: $tabSelection)
                .navigationTitle("Favourites")
        }
    }
}

struct FavouriteQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteQuotesView(tabSelection: .constant(2))
    }
}
