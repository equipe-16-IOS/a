//
//  SelectedListSheet.swift
//  Aplicativo2
//
//  Created by Izadora Montenegro on 13/08/25.
//

import SwiftUI

struct SelectedListSheet: View {
    @ObservedObject var listViewModel = ListViewModel.shared
    
    let selectedProduct: Product?
    
    var body: some View {
        VStack {
            Text("escolha sua lista :P")
            
            if listViewModel.lists.isEmpty {
                Text("Sem listas. Adicione uma pra começar")
            } else {
                ForEach(listViewModel.lists) { list in
                    Button(action: {
                        if let newProduct = selectedProduct {
                            listViewModel.addProductOnList(product: newProduct, list: list)
                        } else {
                            // TODO: EMITIR ALERTA DIZENDO QUE DEU ERRO (COMO NO FORMS)
                            print("Erro ao selecionar produto")
                        }
                    }, label: {
                        Text(list.name)
                    })
                }
            }
        }
    }
}

