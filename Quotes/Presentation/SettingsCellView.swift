//
//  SettingsCellView.swift
//  Quotes
//
//  Created by Artem Orlov on 30.09.23.
//

import SwiftUI

struct SettingsCellView: View {
    let title: String
    let imageName: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}

struct SettingsCellView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCellView(title: "Voice", imageName: "speaker.wave.2.circle.fill")
    }
}
