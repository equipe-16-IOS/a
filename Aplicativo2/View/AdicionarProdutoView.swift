//
//  AdicionarProdutoView.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//

import SwiftUI

struct AdicionarProdutoView: View {
    @ObservedObject var viewModel: AddProductViewModel = .shared
    @State private var nomeProduto = ""
    @State var calorias = ""
    @State private var preco = ""
    @State private var validade: Date = Date()
    @State private var categoria = ""
    @State private var imagem: Data?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .padding()
                            .overlay {
                                Circle()
                                    .stroke(Color.black, lineWidth: 1)
                            }
                    })
                    
                    Spacer()
                    
                }
                .padding()
                           Text("Adicionar Produto")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.blue)
                    Spacer()
                    
                VStack(alignment: .leading, spacing: 18){
                    
                    //NOME DO PRODUTO
                    Text( "Nome do Produto")
                    TextField("Ex: Macarrão Parafuso", text: $nomeProduto)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    //CALORIAS
                    Text( "Calorias")
                    TextField("Ex: 250.00kcal", text: $calorias)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    //PREÇO
                    Text( "Preço")
                    TextField("Ex: R$ 15.00", text: $preco)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    //VALIDADE
                    DatePicker("Validade", selection: $validade, displayedComponents: .date)
                        .datePickerStyle(.compact)
                    
                    //CATEGORIAS
                    
                    Text("Categorias")
                    TextField("Ex: Frutas", text: $categoria)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    }
                Spacer()
                //TODO ADD BOTÃO
                //BOTÃO
              
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
    #Preview {
        AdicionarProdutoView()
    }
