//
//  FavouriteQuotesView.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import SwiftUI

struct FavouriteQuotesView: View {
    @ObservedObject var vm = FavouriteQuotesModel()
    @Binding var tabSelection: Int

    var body: some View {
        NavigationView {
            if vm.quotes.isEmpty {
                QuotesEmptyView(bodyText: "You have no favourite quotes", tabSelection: $tabSelection)
                    .navigationTitle("Favourites")
            } else {
                List(vm.quotes, id: \.quote) {
                    Text($0.quote)
                }
            }
        }
    }
}

struct FavouriteQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteQuotesView(tabSelection: .constant(2))
    }
}
