//
//  ConfiguracoesViewModel.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 02/08/25.
//
import SwiftUI

class PreferencesViewModel: ObservableObject {
    @Published var preferences: Preferences?
    
    func toggleNotifications(value: Bool) {
        preferences?.isNotificationsEnabled = value
    }
}
