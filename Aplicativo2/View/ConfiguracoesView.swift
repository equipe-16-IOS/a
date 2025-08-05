//
//  ConfiguracoesView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//
import SwiftUI

struct ConfiguracoesView: View {
    @StateObject private var viewModel = PreferencesViewModel()
    @State var isNotificationsEnabled: Bool = false
    @State var selectedLanguage: LanguageOptions = .portuguese
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Título
                Text("Configurações")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Divider()
                
                // Toggle de notificações
                HStack {
                    Text("Notificações:")
                        .fontWeight(.semibold)
                    Spacer()
                    Toggle("", isOn: $isNotificationsEnabled)
                        .labelsHidden()
                        .tint(.blue)
                }
                
                // Picker de idioma
                HStack {
                    Text("Idioma:")
                        .fontWeight(.semibold)
                    Spacer()
                    Picker(selection: $selectedLanguage, label: Text(selectedLanguage.displayText)) {
                        ForEach(LanguageOptions.allCases, id: \.self) { language in
                            Text(language.displayText)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Divider()
                
                // Sobre o App
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sobre o App")
                        .font(.headline)
                    Text("Esta é apenas uma versão teste e não está totalmente finalizada!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
            .onChange(of: isNotificationsEnabled) {
                viewModel.toggleNotifications(value: isNotificationsEnabled)
            }
        }
    }
}
