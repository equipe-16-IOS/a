import SwiftUI

struct ConfiguracoesView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Configurações")
                    .font(.largeTitle)
                    .bold()

                Text("Aqui você pode adicionar preferências, perfil, notificações, etc.")
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()
            }
            .padding()
            .navigationTitle("Configurações")
        }
    }
}

#Preview {
    ConfiguracoesView()
}
