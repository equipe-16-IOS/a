import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            // ABA 1: HOME
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            // ABA 2: MINHAS LISTAS
            MinhasListasView()
                .tabItem {
                    Label("Minhas Listas", systemImage: "list.bullet")
                }

            // ABA 3: CONFIGURAÇÕES
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
