//
//  ConfiguracoesViewModel.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 02/08/25.
//
import SwiftUI

class ConfiguracoesViewModel: ObservableObject {
    @Published var notificacoesAtivadas: Bool = true
    @Published var idiomaSelecionado: String = "Português"
    
    let idiomasDisponiveis = ["Português", "Inglês", "Espanhol"]
}
