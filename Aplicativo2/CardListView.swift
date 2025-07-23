import SwiftUI

struct CardListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Minhas Listas")
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)

                    VStack(spacing: 16) {
                        CardList(titleList: "Frutas", iconList: "frutas", color: .green, itemCount: 8)
                        CardList(titleList: "Carnes", iconList: "carnes", color: .red, itemCount: 4)
                        CardList(titleList: "Bebidas", iconList: "bebidas", color: .blue, itemCount: 6)
                        CardList(titleList: "Limpeza", iconList: "produtos", color: .purple, itemCount: 3)
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
