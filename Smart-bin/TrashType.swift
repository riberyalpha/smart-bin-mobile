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
    @Published var isConnected: Bool = false
    private var timer: Timer?
    
    func startFetchingTrashType() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            self?.fetchTrashType()
        }
        fetchTrashType()
    }
    
    func stopFetchingTrashType() {
        timer?.invalidate()
    }
    
    private func fetchTrashType() {
        //guard let url = URL(string: "http://192.168.1.231:5001/api/trash_type") else { return }
        guard let url = URL(string: "http://127.0.0.1:5001/api/trash_type") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Error al hacer la solicitud: \(error)")
                DispatchQueue.main.async {
                    self?.isConnected = false
                }
                return
            }
            
            guard let data = data else {
                print("No data received")
                DispatchQueue.main.async {
                    self?.isConnected = false
                }
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response data:\n\(jsonString)")
            }
            
            DispatchQueue.main.async {
                do {
                    let trashType = try JSONDecoder().decode(TrashType.self, from: data)
                    self?.trashType = trashType
                    self?.isConnected = true
                } catch {
                    print("Error al decodificar datos: \(error)")
                    self?.isConnected = false
                }
            }
        }.resume()
    }
}
