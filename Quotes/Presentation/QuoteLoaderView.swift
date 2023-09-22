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

            if viewModel.showLoading  {
                ProgressView()
            } else {
                VStack {
                    Text(viewModel.quote?.quote ?? "")
                        .padding()
                        .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.blue, lineWidth: 2)
                            )
                        .padding()
                    Text("–" + (viewModel.quote?.author ?? ""))
                }
            }

            Spacer()

            HStack(spacing: 50) {
                Button {
                    viewModel.reloadQuote()
                } label: {
                    HStack(spacing: 5) {
                        Text("Reload")
                            .fontWeight(.bold)
                        Image(systemName: "arrow.clockwise.circle")
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.showLoading)
                .padding(.bottom, 8)

                Button {
                    viewModel.saveQuote()
                } label: {
                    HStack(spacing: 5) {
                        Text("Save")
                            .fontWeight(.bold)
                        Image(systemName: "heart.fill")
                    }
                }
                .tint(.green)
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.showLoading)
                .padding(.bottom, 8)

            }
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
