//
//  AddProductViewModel.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 03/08/25.
//

import SwiftUI

class AddProductViewModel: ObservableObject {
    @Published var AddProduct: [Product] = []
    
    private init() {}
    static let shared = AddProductViewModel()
    
    func addProduct(name: String, calories: Int, price: Double, validity: Date, category: ProductCategory, productImage: Data) {
        let newProduct = Product(name: name, calories: calories, price: price, validity: validity, category: category, productImage: productImage)
        AddProduct.append(newProduct)
    }
}
