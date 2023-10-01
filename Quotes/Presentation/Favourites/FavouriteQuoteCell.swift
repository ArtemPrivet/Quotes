//
//  FavouriteQuoteCell.swift
//  Quotes
//
//  Created by Artem Orlov on 30.09.23.
//

import SwiftUI

struct FavouriteQuoteCell: View {
    @State var quote: String
    @State var author: String
    @State var date: String

    init(quote: String, author: String, date: String) {
        self.quote = quote
        self.author = author
        self.date = date
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(quote)
                .italic()
            HStack {
                Text(author)
                Spacer()
                Text(date)
            }
            .font(.caption2)
        }
        .padding(.bottom, 4)
    }
}

struct FavouriteQuoteCell_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteQuoteCell(quote: "This is my quote", author: "–Kanye", date: "29 Sep")
            .previewLayout(.sizeThatFits)
    }
}
