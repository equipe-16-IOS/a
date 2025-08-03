//
//  AdicionarProdutoView.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//

import SwiftUI

struct AdicionarProdutoView: View {
    @ObservedObject var viewModel: AddProductViewModel = .shared
    @State var nome = ""
    @State var calorias = 0
    @State var preco = 0.0
    @State var validade: Date?
    @State var imagem: Data?
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
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
    #Preview {
        AdicionarProdutoView()
    }

