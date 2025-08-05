//
//  User.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 04/08/25.
//

import SwiftUI

class Preferences {
    var isNotificationsEnabled: Bool
    var selectedLanguage: LanguageOptions
    
    init(isNotificationsEnabled: Bool, selectedLanguage: LanguageOptions) {
        self.isNotificationsEnabled = isNotificationsEnabled
        self.selectedLanguage = selectedLanguage
    }
}

enum LanguageOptions: String, CaseIterable {
    case portuguese, english, spanish
    
    var displayText: String {
        switch self {
        case .portuguese:
            return "Português"
        case .english:
            return "Inglês"
        case .spanish:
            return "Espanhol"
        }
    }
    
}

