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
                    Label("Home", systemImage: "house")
                }

            CardListView()
                .tabItem {
                    Label("Minhas Listas", systemImage: "list.bullet")
                }

            ConfiguracoesView()
                .tabItem {
                    Label("Configurações", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    TabBarView()
}
