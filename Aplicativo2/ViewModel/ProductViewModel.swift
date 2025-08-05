//
//  AddProductViewModel.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 03/08/25.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    private init() {}
    static let shared = ProductViewModel()
    
    func addProduct(name: String, calories: Int, price: Double, validity: Date, category: ProductCategory, productImage: Data?) {
        let newProduct = Product(name: name, calories: calories, price: price, validity: validity, category: category, productImage: productImage)
        products.append(newProduct)
        
        print(products.last?.name ?? "Lista vazia sem last")
    }
}
