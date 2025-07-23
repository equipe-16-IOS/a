//
//  SwiftUIView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
        VStack(alignment: .leading, spacing: 20) {
            
            // Topo azul com botão +
            NavigationLink(destination: CriarLista(), label: {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Crie sua lista e")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("adicione produtos")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 40, height: 40)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
            })
            .padding(.horizontal)
            
            // Barra de busca
            // TODO: TORNAR UTILIZAVEL
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                Text("O que deseja achar?")
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            
            // Grid com as categorias
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                
                NavigationLink(destination: ContentView(), label: {
                    CategoriaCard(imageName: "frutas", title: "Frutas e Vegetais")
                })
               
                CategoriaCard(imageName: "bebidas", title: "Bebidas")
                CategoriaCard(imageName: "carnes", title: "Carnes")
                CategoriaCard(imageName: "produtos", title: "Meus Produtos")
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Botão azul embaixo
            NavigationLink(destination: AdicionarProdutoView(), label: {
                Text("Adicionar Produtos")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(20)
            })
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
    }
}
#Preview {
    HomeView()
}
