//
//  AdicionarProdutoView.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//

import SwiftUI
import PhotosUI

struct CategoriaSelectorView: View {
    @Binding var selectedCategory: ProductCategory
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(ProductCategory.allCases) { categoria in
                    Button {
                        selectedCategory = categoria
                    } label: {
                        Text(categoria.displayText)
                            .font(.subheadline)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(selectedCategory == categoria ? Color.blue : Color.gray.opacity(0.3))
                            )
                            .foregroundColor(selectedCategory == categoria ? .white : .black)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.vertical, 8)
        }
    }
}

struct AdicionarProdutoView: View {
    @ObservedObject var productViewModel: ProductViewModel = .shared
    @Environment(\.dismiss) var dismiss
    
    @State private var nomeProduto: String = ""
    @State private var calorias: Int = 0
    @State private var preco: Double = 0.0
    @State private var validade: Date = Date()
    @State private var categoria: ProductCategory = .frutasEVegetais
    @State private var imagem: Data? = nil
    
    @State private var caloriasText: String = ""
    @State private var precoText: String = ""
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    @State private var mostrarAlerta = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Botão voltar
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
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
                
                // Campos de texto
                Group {
                    Text("Nome do Produto").fontWeight(.semibold)
                    TextField("Ex: Macarrão Parafuso", text: $nomeProduto)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Calorias").fontWeight(.semibold)
                    TextField("Ex: 250", text: $caloriasText)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: caloriasText) { oldValue, newValue in
                            if let value = Int(newValue) {
                                calorias = value
                            } else {
                                calorias = 0
                            }
                        }
                    
                    Text("Preço").fontWeight(.semibold)
                    TextField("Ex: 15.00", text: $precoText)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: precoText) { oldValue, newValue in
                            let cleanValue = newValue.replacingOccurrences(of: ",", with: ".")
                            if let value = Double(cleanValue) {
                                preco = value
                            } else {
                                preco = 0
                            }
                        }
                    
                    Text("Validade").fontWeight(.semibold)
                    DatePicker("", selection: $validade, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    
                    Text("Categoria").fontWeight(.semibold)
                    CategoriaSelectorView(selectedCategory: $categoria)
                }
                
                // Seletor de imagem
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundColor(.gray.opacity(0.5))
                        .frame(width: 354, height: 153)
                        .overlay {
                            if let selectedImage {
                                selectedImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 354, height: 153)
                                    .clipped()
                                    .cornerRadius(10)
                            } else {
                                VStack {
                                    Image(.addImg)
                                        .font(.system(size: 28))
                                        .padding(.bottom, 4)
                                    Text("Adicione uma imagem")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.top, 10)
                }
                .onChange(of: selectedItem) { _, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            imagem = data
                            if let uiImage = UIImage(data: data) {
                                selectedImage = Image(uiImage: uiImage)
                            }
                        }
                    }
                }
                
                // Botão adicionar
                HStack {
                    Spacer()
                    Button {
                        guard !nomeProduto.isEmpty, calorias > 0, preco > 0, imagem != nil else {
                            mostrarAlerta = true
                            return
                        }
                        
                        productViewModel.addProduct(
                            name: nomeProduto,
                            calories: calorias,
                            price: preco,
                            validity: validade,
                            category: categoria,
                            productImage: imagem
                        )
                        
                        dismiss()
                    } label: {
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
        .alert("Preencha todos os campos corretamente", isPresented: $mostrarAlerta) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    AdicionarProdutoView()
}
