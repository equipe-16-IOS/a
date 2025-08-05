//
//  CardListView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//


import SwiftUI

struct CardListView: View {
    @ObservedObject var listViewModel = ListViewModel.shared
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(spacing: 16) {
                        ForEach(listViewModel.lists) { list in
                            CardList(titleList: list.name, iconList: list.icon, color: list.color, itemCount: list.products.count)
                        }
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
