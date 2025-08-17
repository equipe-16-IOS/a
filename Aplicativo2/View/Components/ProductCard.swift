//
//
//  ProductCard.swift
//  Aplicativo2
//
//  Created by Izadora Montenegro on 13/08/25.
//

import SwiftUI

struct ProductCard: View {
    
    //  TODO: TROCAR PELA FONTE VERDADEIRA
    
    let item: Product
    
    @Binding var showSelectListSheet: Bool
    
    @Binding var selectedProduct: Product?
    
    var body: some View {
        VStack {
            
            if item.productImage == nil {
                
                if let defaultImage = item.defaultProductImage {
                    Image(defaultImage)
                } else {
                    Image(item.category.imageName)
                }
                
            } else {
                // TODO: COLOCAR A IMAGEM DO PRODUTO QUANDO FOR ADICIONADA PELO USUÁRIO
                Image(item.category.imageName)
            }
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .fontWeight(.bold)
                    
                    Text(item.calories.description)
                }
                
                Spacer()
            }
            
            HStack {
                Text("R$ \(item.price.description)")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    selectedProduct = item
                    print("selecionou itemmmmm")
                    showSelectListSheet = true
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(13)
                        .background {
                            Color.blue
                        }
                        .cornerRadius(17)
                })
                
            }
        }
        .frame(height: 228)
        .padding(13)
        .overlay {
            // TODO: SUBSTITUIR CORES DE VERDADE
           RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray, lineWidth: 1)
        }
    }
}
