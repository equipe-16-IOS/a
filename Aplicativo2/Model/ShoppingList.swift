//
//  List.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//

import SwiftUI

class ShoppingList {
    var name: String
    var date: Date
    var description: String
    var color: Color
    var icon: String
    
    init(name: String, date: Date, description: String, color: Color, icon: String) {
        self.name = name
        self.date = date
        self.description = description
        self.color = color
        self.icon = icon
    }
}
