//
//  TrashTypeCardViewWrapper.swift
//  Smart-bin
//
//  Created by Iván Rosas on 03/08/24.
//

import SwiftUI

struct TrashTypeCardViewWrapper: View {
    let trashType: TrashType
    
    var body: some View {
        TrashTypeCard(trashType: trashType)
            .navigationTitle("Cesto de Basura")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gearshape")
                        .padding()
                }
            }
    }
}

struct TrashTypeCard: View {
    let trashType: TrashType
    
    var body: some View {
        VStack {
            Image(systemName: trashType.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 20)
            
            Text(trashType.type)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)
                .padding(.bottom, 20)
            
            Text("Este es el tipo de basura detectado por la máquina.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        .padding()
    }
}

#Preview {
    TrashTypeCardViewWrapper(trashType: TrashType(type: "Vidrio", imageName: "waterbottle.fill"))
}

