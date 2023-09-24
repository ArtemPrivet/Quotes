//
//  SettingsView.swift
//  Quotes
//
//  Created by Artem Orlov on 24.09.23.
//

import SwiftUI

struct SettingsView: View {
    private let settingsArray = [SettingsModel(title: "Voice", id: 0, destination: .speechRecognition)]

    var body: some View {
        NavigationView {
            List(settingsArray, id: \.id) { source in
                NavigationLink {
                    LinkPresenter { VoiceRecognitionView() }
                } label: {
                    Text(source.title)
                }
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
