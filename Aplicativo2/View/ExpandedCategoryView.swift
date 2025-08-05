//
//  ExpandedCategoryView.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 04/08/25.
//

import SwiftUI

struct ExpandedCategoryView: View {
    @ObservedObject var productViewModel: ProductViewModel = ProductViewModel.shared
    let category: ProductCategory
    var body: some View {
        VStack {
            Text(category.displayText)
            ForEach(productViewModel.products) { product in
                if product.category == category {
                    Text(product.name)
                }
            }
        }
    }
}

