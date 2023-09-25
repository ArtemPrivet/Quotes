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
            VStack {
                Form {
                    Section {
                        NavigationLink("Voice", destination: VoiceRecognitionView())
                        NavigationLink("App Icon", destination: ChangeAppIconView())
                    } header: {
                        Text("Basic")
                    }
                }
                Spacer()
                Text("Version: 1.0.0")
                    .foregroundColor(Color("textWhite").opacity(0.7))
            }
            .background(Color("backgroundDefault"))
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
