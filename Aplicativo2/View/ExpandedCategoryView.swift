//
//  ExpandedCategoryView.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 04/08/25.
//

import SwiftUI

struct ExpandedCategoryView: View {
    @Environment(\.modelContext) var context
    @ObservedObject var productViewModel: ProductViewModel = ProductViewModel.shared
    let category: ProductCategory
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    @State var showSelectListSheet: Bool = false
    
    @State var selectedProduct: Product?
    
    var body: some View {
        VStack {
            Text(category.displayText)
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(productViewModel.products) { product in
                        if product.category == category {
                            ProductCard(item: product, showSelectListSheet: $showSelectListSheet, selectedProduct: $selectedProduct)
                        }
                    }
                }
            }
        }
        .padding()
        .sheet(isPresented: $showSelectListSheet, content: {
            SelectedListSheet(selectedProduct: selectedProduct)
        })
        .onAppear {
            productViewModel.fetchProducts(context: context)
        }
    }
}
