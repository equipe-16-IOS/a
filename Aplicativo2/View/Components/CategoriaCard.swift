//
//  CategoriaCard.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//


import SwiftUI

struct CategoriaCard: View {
    var imageName: String
    var title: String

    var body: some View {
        VStack(spacing: 12) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)

            Text(title)
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
    }
}
