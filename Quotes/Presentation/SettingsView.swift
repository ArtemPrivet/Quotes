//
//  SettingsView.swift
//  Quotes
//
//  Created by Artem Orlov on 24.09.23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Voice", destination: VoiceRecognitionView())
                NavigationLink("App Icon", destination: ChangeAppIconView())
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
