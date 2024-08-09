//
//  DeviceCard.swift
//  Smart-bin
//
//  Created by Iván Rosas on 03/08/24.
//

import SwiftUI

struct DeviceCard: View {
    let description: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text(description)
                .foregroundColor(.black)
            Spacer()

            Button {
                isOn.toggle()
                
            } label: {
                Text(isOn ? "CONECTADO" : "DESCONECTADO")
                    .padding(.horizontal, 15)
                    .padding(.vertical, 8)
                    .foregroundColor(isOn ? .white : .black)
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(isOn ? Color.black : Color.white)
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


//#Preview {
//    DeviceCard(description: "Basura ")
//}
