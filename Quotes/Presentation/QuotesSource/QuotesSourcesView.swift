//
//  QuotesSourcesView.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import SwiftUI
import Combine

struct QuotesSourcesView: View {
    @StateObject var viewModel = QuoteSourceViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.quoteSources, id: \.id) { source in
                NavigationLink {
                    LinkPresenter { QuoteLoaderView<QuoteLoaderViewModel>(source: source) }
                } label: {
                    QuoteSourceCell(source: source)
                }

            }
            .navigationTitle(R.string.localizable.quotes())
            .onAppear {
                viewModel.getSources()
            }
        }
    }
}

struct QuotesSourcesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesSourcesView()
    }
}
