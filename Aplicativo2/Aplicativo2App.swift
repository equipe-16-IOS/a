//
//  Aplicativo2App.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 16/07/25.
//

import SwiftUI
import SwiftData

@main
struct Aplicativo2App: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .modelContainer(for: [Product.self])
    }
}
