//
//  QuoteSourceCell.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import SwiftUI

struct QuoteSourceCell: View {
    @State var source = QuoteSourceModel(name: "test", id: 11, imageName: "test")
    var body: some View {
        HStack {
            Image(source.imageName)
                .background(Color.black)
        }
    }
}

struct QuoteSourceCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSourceCell()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
