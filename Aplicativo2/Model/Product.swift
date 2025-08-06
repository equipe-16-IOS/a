//
//  Product.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//

import Foundation

class Product: Identifiable, Codable {
    var id: UUID
    var name: String
    var calories: Int
    var price: Double
    var validity: Date
    var category: ProductCategory
    var productImage: Data?
    
    init(name: String, calories: Int, price: Double, validity: Date, category: ProductCategory, productImage: Data? = nil) {
        self.id = UUID()
        self.name = name
        self.calories = calories
        self.price = price
        self.validity = validity
        self.category = category
        self.productImage = productImage
    }
    

}

//TODO adicionar mais categorias
enum ProductCategory: String, CaseIterable, Codable, Identifiable {
    case frutasEVegetais
    case carnes
    case bebidas
    case meusProdutos
    
    var id: String { self.rawValue }
    
    var imageName: String {
        switch self {
        case .frutasEVegetais:
            return "frutas-e-vegetais"
        case .carnes:
            return "carnes"
        case .bebidas:
            return "bebidas"
        case .meusProdutos:
            return "meus-produtos"
        }
    }
    
    var displayText: String {
        switch self {
        case .frutasEVegetais:
            return "Frutas e vegetais"
        case .carnes:
            return "Carnes"
        case .bebidas:
            return "Bebidas"
        case .meusProdutos:
            return "Meus produtos"
        }
    }
}
