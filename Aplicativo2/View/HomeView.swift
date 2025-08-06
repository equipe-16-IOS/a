//
//  SwiftUIView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//
import SwiftUI

enum Route: Hashable {
    case expandedCategory(category: ProductCategory), addProuct, addList
}

struct HomeView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
        VStack(alignment: .leading, spacing: 20) {
            Button {
                path.append(Route.addList)
            } label: {
                HStack {
                   
                    Text("Crie sua lista e\("\n")adicione produtos")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                            
                    
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
                .padding(.horizontal)
            }
                
         
            
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
                
                Button(action: {
                    path.append(Route.expandedCategory(category: .frutasEVegetais))
                }, label: {
                    CategoriaCard(imageName: "frutas", title: "Frutas e Vegetais")
                })
                
                Button(action: {
                    path.append(Route.expandedCategory(category: .bebidas))
                }, label: {
                    CategoriaCard(imageName: "bebidas", title: "Bebidas")
                })
                
                Button(action: {
                    path.append(Route.expandedCategory(category: .carnes))
                }, label: {
                    CategoriaCard(imageName: "carnes", title: "Carnes")
                })
                
                Button(action: {
                    path.append(Route.expandedCategory(category: .meusProdutos))
                }, label: {
                    CategoriaCard(imageName: "produtos", title: "Meus Produtos")
                })
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Botão azul embaixo
            Button {
                path.append(Route.addProuct)
            }    label: {
                Text("Adicionar Produtos")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .navigationDestination(for: Route.self) { route in
            switch route {
            case .addList:
                CriarLista()
            case .addProuct:
                AdicionarProdutoView()
            case .expandedCategory(let category):
                    ExpandedCategoryView(category: category)
            }
        }
    }
    }
}
#Preview {
    HomeView()
}
