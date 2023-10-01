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
                        NavigationLink {
                            LinkPresenter { VoiceRecognitionView() }
                        } label: {
                            SettingsCellView(title: "Voice", imageName: "speaker.wave.2.circle.fill")
                        }

                        NavigationLink {
                            LinkPresenter { ChangeAppIconView() }
                        } label: {
                            SettingsCellView(title: "App Icon", imageName: "app")
                        }
                    } header: {
                        Text("Basic")
                    }
                }
                Spacer()
                Text("Version: 1.0.0")
                    .foregroundColor(Color(R.color.textWhite.name).opacity(0.7))
            }
            .background(Color(R.color.backgroundDefault.name))
            .navigationTitle(R.string.localizable.settings())
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
