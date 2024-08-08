//
//  ContentView.swift
//  Smart-bin
//
//  Created by Iván Rosas on 03/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var trashTypeService: TrashTypeService = TrashTypeService()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Smart Bin")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "plus")
                }
                .padding()
                .font(.title)
                VStack {
                    Text("Dispositivos")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    if let trashType = trashTypeService.trashType {
                        NavigationLink(destination: TrashTypeCardViewWrapper(trashType: trashType)) {
                            DeviceCard(description: "Cesto de Basura", isOn: $trashTypeService.isConnected)
                        }
                    } else {
                        VStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 100) // Ajusta la altura según sea necesario
                                .overlay(
                                    VStack {
                                        ProgressView() // Círculo de carga
                                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                                            .scaleEffect(1.5) // Tamaño del círculo
                                        }
                                )
                                .padding()
                        }
                    }
                }
                Spacer()
            }
        }
        .navigationTitle("Smart Bin")
        .onAppear {
            trashTypeService.startFetchingTrashType()
        }
        .onDisappear {
            trashTypeService.stopFetchingTrashType()
        }
    }
}



#Preview {
    ContentView()
}
