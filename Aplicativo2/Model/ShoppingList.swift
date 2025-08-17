//
//  List.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//

import SwiftUI
import SwiftData

class ShoppingList: Identifiable {
    var id: UUID
    var name: String
    var date: Date
    var descricao: String
    var color: Color
    var icon: String
    var products: [Product]
    
    init(name: String, date: Date, descricao: String, color: Color, icon: String) {
        self.name = name
        self.date = date
        self.descricao = descricao
        self.color = color
        self.icon = icon
        self.products = []
        self.id = UUID()
    }
}
