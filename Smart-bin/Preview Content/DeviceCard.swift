//
//  DeviceCard.swift
//  Smart-bin
//
//  Created by Iván Rosas on 03/08/24.
//

import SwiftUI

struct DeviceCard: View {
    let description: String
    
    @State private var isOn: Bool = true

    
    var body: some View {
        HStack{
            Text(description)
                .foregroundColor(.black)
            Spacer()

            Button{
                isOn.toggle()
                
            } label: {
                Text(isOn ? "CONECTADO" : "DESCONECTADO")
                    .padding(.horizontal, 15)
                    .padding(.vertical, 8)
                    .foregroundColor(isOn ? .white : .black) // Texto blanco si encendido, negro si apagado
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(isOn ? Color.black : Color.white) // Fondo negro si encendido, blanco si apagado
            )

        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(red: 0.965, green: 0.965, blue: 0.965))
        )
        .padding()
        }

}

#Preview {
    DeviceCard(description: "Basura ")
}
