//
//  ListViewModel.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//

import SwiftUI

class ListViewModel: ObservableObject {
    @Published var lists: [ShoppingList] = []
    
    static let shared = ListViewModel()
    private init() {}
    
    func addList(name: String, date: Date, description: String, color: Color, icon: String) {
        let newList = ShoppingList(name: name, date: date, description: description, color: color, icon: icon)
        lists.append(newList)
    }
    
    func addProductOnList(product: Product, list: ShoppingList) {
        list.products.append(product)
    }
}
