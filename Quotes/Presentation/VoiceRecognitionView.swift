//
//  VoiceRecognitionView.swift
//  Quotes
//
//  Created by Artem Orlov on 24.09.23.
//

import SwiftUI

struct VoiceRecognitionView: View {
    @AppStorage(UserDefaultsHelper.Keys.recognitionVoice.rawValue) private var voice = SpeechLanguage.enUS.rawValue

    var body: some View {
        Picker("Voice", selection: $voice) {
            ForEach(SpeechLanguage.allCases, id: \.rawValue) {
                Text($0.rawValue)
            }
        }
    }
}

struct VoiceRecognitionView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceRecognitionView()
    }
}
