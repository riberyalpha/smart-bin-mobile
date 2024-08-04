//
//  ViewDevice.swift
//  Smart-bin
//
//  Created by Iván Rosas on 03/08/24.
//

import SwiftUI

struct ViewDevice: View {
    var body: some View {
        VStack {
            Text("scanning...")
                .font(.title)
                .foregroundColor(.gray)
                .padding()
            
            // Agrega aquí el contenido específico de ViewDevice
        }
        .navigationTitle("Bote de Basura") // Título de la vista de dispositivo
        .toolbar {
            /*ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Image(systemName: "chevron.left")
                        .padding()
                    // Aquí puedes agregar una acción para el botón de "chevron.left"
                }
            }*/
            ToolbarItem(placement: .principal) {
                Text("Bote de Basura")
                    .padding()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "gearshape")
                    .padding()
                    // Aquí puedes agregar una acción para el botón de "gearshape"
            }
        }
    }
}


#Preview {
    ViewDevice()
}
