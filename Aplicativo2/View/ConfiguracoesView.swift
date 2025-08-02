//
//  ConfiguracoesView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//
import SwiftUI

struct ConfiguracoesView: View {
    @StateObject private var viewModel = ConfiguracoesViewModel()
    
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
                    Toggle("", isOn: $viewModel.notificacoesAtivadas)
                        .labelsHidden()
                        .tint(.blue)
                }
                
                // Picker de idioma
                HStack {
                    Text("Idioma:")
                        .fontWeight(.semibold)
                    Spacer()
                    Picker(selection: $viewModel.idiomaSelecionado, label: Text(viewModel.idiomaSelecionado)) {
                        ForEach(viewModel.idiomasDisponiveis, id: \.self) {
                            Text($0)
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
        }
    }
}
