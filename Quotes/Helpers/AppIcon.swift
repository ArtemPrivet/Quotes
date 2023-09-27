//
//  AppIcon.swift
//  Quotes
//
//  Created by Artem Orlov on 24.09.23.
//

import UIKit

enum AppIcon: String, CaseIterable, Identifiable {
    case primary = "AppIcon"
    case quotable = "AppIcon-Quotable"

    var id: String { rawValue }

    var iconName: String? {
        switch self {
        case .primary:
            return nil
        default: return rawValue
        }
    }

    var description: String {
        switch self {
        case .primary:
            return "Default"
        case .quotable:
            return "Quotable"
        }
    }

    var preview: UIImage {
        switch self {
        case .primary:
            return R.image.kanye()!
        case .quotable:
            return R.image.quotable()!
        }
    }
}
