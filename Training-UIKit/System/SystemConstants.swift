//
//  SystemConstants.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 26..
//

public enum LanguageCode: String {
    case en
    case hu
    
    var localizedValue: String {
        switch self {
        case .en:
            Keys.languageCodeEn
        case .hu:
            Keys.languageCodeHu
        }
    }
}

enum ColorScheme: String {
    case light
    case dark
    case auto
    
    var localizedValue: String {
        switch self {
        case .light:
            Keys.darkModeOff
        case .dark:
            Keys.darkModeOn
        case .auto:
            Keys.darkModeAutomatic
        }
    }
}
