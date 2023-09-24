//
//  SettingsModel.swift
//  Quotes
//
//  Created by Artem Orlov on 24.09.23.
//

import Foundation

struct SettingsModel {
    let title: String
    let id: Int
    let destination: SettingsDestination
}

enum SettingsDestination {
    case speechRecognition
}
