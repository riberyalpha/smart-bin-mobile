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
    private var timer: Timer?
    
    func startFetchingTrashType() {
        // Iniciar temporizador para actualizar el tipo de basura cada 2 segundos
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            self?.fetchTrashType()
        }
        // Ejecutar inmediatamente al iniciar
        fetchTrashType()
    }
    
    func stopFetchingTrashType() {
        timer?.invalidate()
    }
    
    private func fetchTrashType() {
        guard let url = URL(string: "http://127.0.0.1:5000/api/trash_type") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Error al hacer la solicitud: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Imprimir los datos de la respuesta para depuración
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response data:\n\(jsonString)")
            }
            
            DispatchQueue.main.async {
                do {
                    let trashType = try JSONDecoder().decode(TrashType.self, from: data)
                    self?.trashType = trashType
                } catch {
                    print("Error al decodificar datos: \(error)")
                }
            }
        }.resume()

    }
}
