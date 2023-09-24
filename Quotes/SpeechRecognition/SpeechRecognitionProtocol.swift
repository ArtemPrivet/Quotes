//
//  SpeechRecognitionProtocol.swift
//  Quotes
//
//  Created by Artem Orlov on 24.09.23.
//

import AVFoundation

protocol SpeechRecognitionProtocol {
    func speak(text: String)
}

final class SpeechRecognition {
    private let synthesizer = AVSpeechSynthesizer()
    private let userDefaults = UserDefaults.standard
}

enum SpeechLanguage: String, CaseIterable {
    case enUS = "en-US"
    case enGB = "en-GB"
    case enIE = "en-IE"
}

extension SpeechRecognition: SpeechRecognitionProtocol {
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        let language = userDefaults.string(forKey: UserDefaultsHelper.Keys.recognitionVoice.rawValue)
        let voice = SpeechLanguage(rawValue: language ?? "") ?? .enUS
        utterance.voice = AVSpeechSynthesisVoice(language: voice.rawValue)

        synthesizer.speak(utterance)
    }
}
