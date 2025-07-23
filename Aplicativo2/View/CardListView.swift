//
//  CardListView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//


import SwiftUI

struct CardListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                  
                    VStack(spacing: 16) {
                        CardList(titleList: "Frutas", iconList: "maca", color: .green, itemCount: 8)
                        CardList(titleList: "Carnes", iconList: "bife", color: .red, itemCount: 4)
                        CardList(titleList: "Bebidas", iconList: "taca", color: .blue, itemCount: 6)
                        CardList(titleList: "Limpeza", iconList: "limpeza", color: .purple, itemCount: 3)
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Minhas Listas")
        }
    }
}

#Preview {
    CardListView()
}
