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

    init(source: QuoteSourceModel) {
        viewModel = QuoteLoaderViewModel(source: source) as! T
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
        .navigationTitle(viewModel.title)
        .onAppear {
            if viewModel.shouldLoadQuote {
                viewModel.reloadQuote()
            }
        }
    }
}

struct QuoteLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteLoaderView<QuoteLoaderViewModel>(source: QuoteSourceModel(name: "Kanye West", id: 0, imageName: "kanye", source: .kanye("https://api.kanye.rest")))
    }
}
