//
//  AdicionarProdutoView.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//


import SwiftUI

struct AdicionarProdutoView: View {
    // ALTERAR TIPOS PARA TIPOS CORRETOS DO MODELO PRODUCT!!!
    @ObservedObject var productViewModel: ProductViewModel = .shared
    @Environment(\.dismiss) var dismiss
    @State private var nomeProduto = ""
    @State private var calorias = ""
    @State private var preco = ""
    @State private var validade: Date = Date()
    @State private var categoria = ""
    @State private var imagem: Data?

    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Botão Voltar
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.black)
                                .padding(8)
                                .background(Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1))
                        }
                        Spacer()
                    }
                    .padding(.top, 10)
                    
                    // Título
                    Text("Adicionar Produto")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    
                    Group {
                        Text("Nome do Produto").fontWeight(.semibold)
                        TextField("Ex: Macarrão Parafuso", text: $nomeProduto)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Text("Calorias").fontWeight(.semibold)
                        TextField("Ex: 250 kcal", text: $calorias)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Text("Preço").fontWeight(.semibold)
                        TextField("Ex: R$ 15,00", text: $preco)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Text("Validade").fontWeight(.semibold)
                        DatePicker("", selection: $validade, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()

                        Text("Categorias").fontWeight(.semibold)
                        TextField("Ex: Frutas", text: $categoria)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    // Área para imagem
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundColor(.gray.opacity(0.5))
                        .frame(height: 120)
                        .overlay(
                            VStack {
                                Image(.addImg)
                                    .font(.system(size: 28))
                                    .padding(.bottom, 4)
                                Text("Adicione uma imagem")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        )
                        .padding(.top, 10)

                    // Botão Adicionar centralizado e compacto
                    HStack {
                        Spacer()
                        Button(action: {
                            productViewModel.addProduct(name: nomeProduto, calories: Int(calorias) ?? 0, price: Double(preco) ?? 0, validity: validade, category: categoria == "Oi" ? .bebidas : .carnes, productImage: imagem)
                            
                            dismiss()
                        }) {
                            Text("Adicionar")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 220, height: 50)
                                .background(
                                    LinearGradient(colors: [Color.blue, Color.blue.opacity(0.8)],
                                                   startPoint: .leading,
                                                   endPoint: .trailing)
                                )
                                .cornerRadius(24)
                        }
                        Spacer()
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
            .navigationBarHidden(true)
    }
}

#Preview {
    AdicionarProdutoView()
}
