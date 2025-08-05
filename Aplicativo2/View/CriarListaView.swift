//
//  CriarListaView.swift
//  Aplicativo2
//
//  Created by iredefbmac_28 on 23/07/25.
//
import SwiftUI

struct CriarLista: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewmodel = ListViewModel.shared
    @State private var nomeLista = ""
    @State private var descricao = ""
    @State private var corSelecionada = 0
    @State private var selectedDate: Date = Date()
    @State private var iconeSelecionado = 0
    let icones = ["maca", "bife", "taca", "limpeza", "salada", "pilula"]

    let cores: [Color] = [
        .AppColors.babyBlue, .AppColors.paleLavender, .AppColors.softPeach,
        .AppColors.lightMustard, .AppColors.mintCream, .AppColors.babyPink
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                
                // Botão voltar
                HStack {
                    Button(action: {
                        // dismiss ou navegação
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(8)
                            .background(Circle().stroke(Color.gray.opacity(0.5)))
                    }
                    Spacer()
                }
                .padding(.top, 10)
                
                // Título
                Text("Criar Lista")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Nome da Lista
                Text("Nome da Lista")
                    .font(.headline)
                TextField("Ex: Compras da Semana", text: $nomeLista)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Data
                Text("Data da Compra")
                    .font(.headline)
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                
                // Descrição
                Text("Descrição")
                    .font(.headline)
                ZStack(alignment: .topLeading) {
                    if descricao.isEmpty {
                        Text("Ex: Comprar carnes e temperos pro churrasco")
                            .foregroundColor(.gray)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 6)
                    }
                    TextEditor(text: $descricao)
                        .foregroundColor(.black)
                        .padding(8)
                        .background(Color.clear)
                        .frame(height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1.1)
                        )
                }
                
                // Cor
                Text("Cor")
                    .font(.headline)
                HStack(spacing: 12) {
                    ForEach(0..<cores.count, id: \.self) { index in
                        Circle()
                            .fill(cores[index])
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle()
                                    .stroke(corSelecionada == index ? Color.blue : Color.clear, lineWidth: 2)
                            )
                            .onTapGesture {
                                corSelecionada = index
                            }
                    }
                }
                
                // Ícones
                Text("Ícone")
                    .font(.headline)
                
                HStack(spacing: 12) {
                    ForEach(0..<icones.count, id: \.self) { index in
                        ZStack {
                            Circle()
                                .stroke(iconeSelecionado == index ? Color.blue : Color.gray.opacity(0.4), lineWidth: 2)
                                .frame(width: 50, height: 50)
                            
                            Image(icones[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                        }
                        .onTapGesture {
                            iconeSelecionado = index
                        }
                    }
                }
            }

                // Botão Criar
                HStack {
                    Spacer()
                    Button(action: {
                        viewmodel.addList(
                            name: nomeLista,
                            date: selectedDate,
                            description: descricao,
                            color: .black,
                            icon: "maca"
                        )
                        
                        dismiss()
                        
                        print(viewmodel.lists.first?.name ?? "")
                    }) {
                        Text("Criar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 220, height: 50)
                            .background(
                                LinearGradient(colors: [Color.blue, Color.blue.opacity(0.8)],
                                               startPoint: .leading,
                                               endPoint: .trailing)
                            )
                            .cornerRadius(24)
                    }
                    Spacer()
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 40)
        }
    }


#Preview {
    CriarLista()
}
