//
//  QuoteLoaderView.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import SwiftUI
import Combine

struct QuoteLoaderView<T: QuoteLoaderViewModelProtocol>: View {
    @ObservedObject var viewModel: T

    init(viewModel: T) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            if viewModel.showLoading {
                ProgressView()
            } else {
                Text(viewModel.quote ?? "")
                    .padding()
            }

            Spacer()

            Button("Reload") {
                viewModel.reloadQuote()
            }
            .disabled(viewModel.showLoading)
        }
        .onAppear {
            if viewModel.shouldLoadQuote {
                viewModel.reloadQuote()
            }
        }
    }
}

struct QuoteLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteLoaderView(viewModel: QuoteLoaderViewModel(loader: KanyeWestQuoteLoader()))
    }
}
