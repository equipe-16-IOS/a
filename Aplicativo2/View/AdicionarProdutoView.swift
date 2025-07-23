//
//  AdicionarProdutoView.swift
//  Aplicativo2
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 23/07/25.
//

import SwiftUI

struct AdicionarProdutoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
        HStack {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
                    .padding()
                    .overlay {
                        Circle()
                            .stroke(Color.black, lineWidth: 1)
                    }
            })
            
            Spacer()
        }
        .padding()
        
            Text("Adicionar produto oii")
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    AdicionarProdutoView()
}
