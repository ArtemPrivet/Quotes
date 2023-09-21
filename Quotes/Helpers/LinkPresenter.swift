//
//  LinkPresenter.swift
//  Quotes
//
//  Created by Artem Orlov on 21.09.23.
//

import SwiftUI

struct LinkPresenter<Content: View>: View {
    let content: () -> Content

    @State private var invalidated = false
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        Group {
            if self.invalidated {
                EmptyView()
            } else {
                content()
            }
        }
        .onDisappear { self.invalidated = true }
    }
}
