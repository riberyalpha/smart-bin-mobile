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
                            DeviceCard(description: "Cesto de Basura")
                        }
                    } else {
                        Text("Cargando datos...")
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding()
                    }
                    
                }
                Spacer()
            }
        }
        .navigationTitle("Smart Bin") // Título de la vista de navegación
        .onAppear {
            trashTypeService.fetchTrashType()
        }

    }

}

#Preview {
    ContentView()
}
