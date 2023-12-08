//
//  QuoteOfTheDayView.swift
//  Quotes
//
//  Created by Artem Orlov on 07.12.23.
//

import SwiftUI

struct QuoteOfTheDayView: View {
    @ObservedObject private var viewModel = QuoteOfTheDayViewModel()

    var body: some View {
            ZStack {
                AsyncImage(url: viewModel.imageUrl) { image in
                    // Image successfully loaded
                    ZStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.top)

                        Text(viewModel.text)
                            .font(Fonts.whisperRegular42)
                            .foregroundColor(.black)
                            .padding(20)
                            .background(Color.white.opacity(0.8).blur(radius: 10)) // Blurred background

                    }
                } placeholder: {
                    ProgressView()
                }
            }
    }
}

struct QuoteOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteOfTheDayView()
    }
}
