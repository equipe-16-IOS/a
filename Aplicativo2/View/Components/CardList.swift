//
//  CardList.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 16/07/25.
//
import SwiftUI

struct CardList: View {
    var titleList: String
    var iconList: String // nome da imagem no Assets
    var color: Color
    var itemCount: Int

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 40, height: 40)
                Image(iconList)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(titleList)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("\(itemCount) itens")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding()
        .background(color)
        .cornerRadius(20)
    }
}
#Preview {
    CardList(titleList: "Meus Pedidos", iconList: "cart.fill", color: .blue, itemCount: 12)
}
