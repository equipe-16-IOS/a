//
//  AddProductViewModel.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 03/08/25.
//

import SwiftUI
import SwiftData

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    private init() {
        initDefaultProducts()
    }
    
    static let shared = ProductViewModel()
    
    private func initDefaultProducts() {
        products = ProductRepository.all
    }
    
    func addProduct(name: String, calories: Int, price: Double, validity: Date, category: ProductCategory, productImage: Data?, context: ModelContext) {
        let newProduct = Product(name: name, calories: calories, price: price, validity: validity, category: category, productImage: productImage)
        products.append(newProduct)
        
        context.insert(newProduct)
        
        do {
            try context.save()
        } catch {
            print("Erro ao adicionar novo produto \(error)")
        }
        
        print(products.last?.name ?? "Lista vazia sem last")
    }
    
    func fetchProducts(context: ModelContext) {
        let descriptor = FetchDescriptor<Product>()
        
        products = try! context.fetch(descriptor)
        
        products.insert(contentsOf: ProductRepository.all, at: 0)
    }
    
    
}
