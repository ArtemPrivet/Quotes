//
//  QuoteSourceCell.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import SwiftUI

struct QuoteSourceCell: View {
    @State var source: QuoteSourceModel

    var body: some View {
        HStack {
            Image(source.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(30)
                .padding(.trailing, 8)
            Text(source.name)
                .font(.title)
            Spacer()
        }
    }
}

struct QuoteSourceCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSourceCell(source: QuoteSourceModel(name: "Kanye West", id: 11, imageName: "kanye", source: .kanye("")))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
