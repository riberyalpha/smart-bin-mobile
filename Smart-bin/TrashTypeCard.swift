//
//  TrashCard.swift
//  Smart-bin
//
//  Created by Iván Rosas on 03/08/24.
//

import SwiftUI

struct test: View {
    @StateObject private var trashTypeService = TrashTypeService()
    
    var body: some View {
        NavigationView {
            VStack {
                if let trashType = trashTypeService.trashType {
                    TrashTypeCard(trashType: trashType)
                } else {
                    Text("Cargando datos...")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            .onAppear {
                trashTypeService.fetchTrashType()
            }
        }
    }
}

#Preview {
    test()
}
