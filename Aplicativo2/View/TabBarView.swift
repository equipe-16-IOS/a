//
//  TabBarView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//
import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", image:.home)                }
            
            CardListView()
                .tabItem {
                    Label("Minhas Listas", image: .list)
                }
            
            ConfiguracoesView()
                .tabItem {
                    Label("Configurações", image: .settings)        }
        }
    }
}
    
    #Preview {
        TabBarView()
    }

