//
//  QuotesApp.swift
//  Quotes
//
//  Created by Artem Orlov on 20.09.23.
//

import SwiftUI

@main
struct QuotesApp: App {
    var body: some Scene {
        WindowGroup {
            QuotesTabView()
                .environment(\.managedObjectContext, QuotesStorageService.shared.context)
        }
    }
}
