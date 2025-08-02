//
//  CriarListaView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//
import SwiftUI

struct CriarLista: View {
    @ObservedObject var viewmodel = ListViewModel.shared
    @State private var nomeLista = ""
    @State private var data = ""
    @State private var descricao = ""
    @State private var corSelecionada = 0
    @State private var selectedDate: Date = Date()
    
    let cores: [Color] = [.AppColors.babyBlue, .AppColors.paleLavender, .AppColors.softPeach,.AppColors.lightMustard,.AppColors.mintCream, Color.AppColors.babyPink]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            
            // TÍTULO
            Text("Criar Lista")
                .font(.title2)
                .bold()
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .center)

            // NOME DA LISTA
            Text("Nome da Lista")
                .font(.system(size: 30, weight: .semibold))
            
            TextField("Ex: Compras da Semana", text: $nomeLista)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            //                    .frame(width: 500)
            
            // DATA
            Text("Data")
                .font(.system(size: 30, weight: .semibold))
            
          
            DatePicker("Selecione", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            TextField("Ex: 30/06/2025", text: $data)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            //                    .frame(width: 500)
            
            // DESCRIÇÃO
            Text("Descrição")
                .font(.system(size: 30, weight: .semibold))
            
            TextEditor(text: $descricao)
                .foregroundColor(.black)
                .padding(8)
                .background(Color.clear)
            //                    .frame(width: 500, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1.10)
                )
            //            }
            
            // COR
            Text("Cor")
                .font(.system(size: 30, weight: .semibold))
            
            HStack {
                ForEach(0..<cores.count, id: \.self) { index in
                    Circle()
                        .fill(cores[index])
                        .frame(width: 50, height: 50)
                        .overlay(
                            Circle()
                                .stroke(corSelecionada == index ? Color.blue : Color.clear, lineWidth: 2)
                        )
                        .onTapGesture {
                            corSelecionada = index
                        }
                }
            }
            
            Spacer()
            
            // BOTÃO
            HStack {
                Spacer()
                
                Button(action: {
//                    print("Lista criada: \(nomeLista), \(data), \(descricao), cor: \(corSelecionada)")
                    viewmodel.addList(name: nomeLista, date: selectedDate, description: descricao, color: .black, icon: "maca")
                    
                    print(viewmodel.lists.first?.name ?? "")
                }) {
                    HStack {
                        Text("Criar")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 70)
                    .padding(.vertical, 20)
                    .background(Color.blue)
                    .cornerRadius(30)
                }
                .padding(.trailing, 40)
            }
        }
        .padding(30)
    }
}

#Preview {
    CriarLista()
}
