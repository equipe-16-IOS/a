import SwiftUI

struct CriarListaView: View {
    @State private var nomeLista = ""
    @State private var data = ""
    @State private var descricao = ""
    @State private var corSelecionada: Color = .blue
    
    var body: some View {
        Form {
            Section(header: Text("Nome da Lista")) {
                TextField("Ex: Compras da Semana", text: $nomeLista)
            }
            
            Section(header: Text("Data")) {
                TextField("Ex: 30/06/2025", text: $data)
            }
            
            Section(header: Text("Descrição")) {
                TextField("Ex: Comprar carnes e temperos pro churrasco", text: $descricao)
            }
            
            Section(header: Text("Cor")) {
                ColorPicker("Selecione uma cor", selection: $corSelecionada)
            }
            
            Section {
                Button("Criar Lista") {
                    // Ação para criar a lista
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Criar Lista")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CriarListaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CriarListaView()
        }
    }
}