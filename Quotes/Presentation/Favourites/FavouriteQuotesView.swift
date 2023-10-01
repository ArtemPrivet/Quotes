//
//  FavouriteQuotesView.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import SwiftUI

struct FavouriteQuotesView: View {
    @ObservedObject var vm = FavouriteQuotesModel()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: QuoteDataModel.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \QuoteDataModel.date, ascending: true)])
    var quotes: FetchedResults<QuoteDataModel>
    @Binding var tabSelection: Int

    var body: some View {
        NavigationView {
            if quotes.isEmpty {
                QuotesEmptyView(bodyText: "You have no favourite quotes", tabSelection: $tabSelection)
                    .navigationTitle("Favourites")
            } else {
                List {
                    ForEach(quotes) { quote in
                        FavouriteQuoteCell(quote: quote.viewQuote, author: quote.viewAuthor, date: quote.viewDate)
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            vm.delete(model: quotes[index])
                        }
                    }
                }
                .navigationTitle("Favourites")
            }
        }
    }
}

struct FavouriteQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteQuotesView(tabSelection: .constant(2))
    }
}
