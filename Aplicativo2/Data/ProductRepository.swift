//
//  ProductRepository.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 17/08/25.
//


//
//  ProductRepository.swift
//  Aplicativo2
//
//  Created by Izadora Montenegro on 13/08/25.
//

import SwiftUI

struct ProductRepository {
    
    // MARK: BEBIDAS
    
    static let cocaCola = Product(name: "Coca Cola", calories: 150, price: 2.50, validity: Date(), category: .bebidas, defaultProductImage: "PepsiImage")
    
    static let sprite = Product(name: "Sprite", calories: 150, price: 2.50, validity: Date(), category: .bebidas, defaultProductImage: "SucoLaranjaImage")
    
    static let sucoLaranja = Product(name: "Suco de laranja", calories: 150, price: 2.50, validity: Date(), category: .bebidas, defaultProductImage: "SucoLaranjaImage")
    
    // MARK: CARNES
    
    static let peitoFrango = Product(name: "Peito de frango", calories: 150, price: 2.50, validity: Date(), category: .carnes, defaultProductImage: "SucoLaranjaImage")
    
    static let maminha = Product(name: "Maminha", calories: 150, price: 2.50, validity: Date(), category: .carnes, defaultProductImage: "PepsiImage")
    
    // ....
    
    static let all: [Product] = [
        cocaCola, sprite, sucoLaranja, peitoFrango, maminha
    ]
    
}