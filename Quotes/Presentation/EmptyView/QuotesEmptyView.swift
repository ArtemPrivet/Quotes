//
//  QuotesEmptyView.swift
//  Quotes
//
//  Created by Artem Orlov on 22.09.23.
//

import SwiftUI

struct QuotesEmptyView: View {
    @State var bodyText: String
    @State var buttonText: String
    @Binding var tabSelection: Int

    var body: some View {
        VStack {
            Image(systemName: "heart.circle")
                .resizable()
                .frame(width: 100, height: 100)
            Text(bodyText)
            Button(buttonText) {
                tabSelection = 0
            }
        }
    }
}

struct QuotesEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesEmptyView(bodyText: "You have no favourite quotes",
                        buttonText: R.string.localizable.favourites_add_quotes(),
                        tabSelection: .constant(1))
    }
}
