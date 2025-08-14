//
//  ExpandedListView.swift
//  Aplicativo2
//
//  Created by Izadora Montenegro on 13/08/25.
//

import SwiftUI

struct ExpandedListView: View {
    let list: ShoppingList
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    var body: some View {
        VStack {
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(list.products) { product in
                            Text(product.name)
                        
                    }
                }
            }
        }
        .padding()
    }
}

