//
//  TrashType.swift
//  Smart-bin
//
//  Created by Iván Rosas on 03/08/24.
//

import Foundation
import Combine

struct TrashType: Codable {
    let type: String
    let imageName: String
}

class TrashTypeService: ObservableObject {
    @Published var trashType: TrashType?
    
    func fetchTrashType() {
        let simulatedTrashType = TrashType(type: "Vidrio", imageName: "waterbottle.fill")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.trashType = simulatedTrashType
        }
    }
}
