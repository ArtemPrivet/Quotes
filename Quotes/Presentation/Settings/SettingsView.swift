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
                            SettingsCellView(title: R.string.localizable.settings_voice_cell(), imageName: "speaker.wave.2.circle.fill")
                        }

                        NavigationLink {
                            LinkPresenter { ChangeAppIconView() }
                        } label: {
                            SettingsCellView(title: R.string.localizable.settings_app_icon(), imageName: "app")
                        }
                    } header: {
                        Text(R.string.localizable.settings_header())
                    }
                }
                Spacer()
                Text(R.string.localizable.settings_version("1.0.0"))
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
