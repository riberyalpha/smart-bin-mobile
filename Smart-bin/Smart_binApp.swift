//
//  Smart_binApp.swift
//  Smart-bin
//
//  Created by Iván Rosas on 03/08/24.
//

import SwiftUI

@main
struct Smart_binApp: App {
    /*init() {
        // Configurar la apariencia global de la barra de navegación
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemBackground // Color de fondo de la barra de navegación

        // Configurar el color del título
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        
        // Configurar la apariencia del botón de retroceso
        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black] // Color del texto del botón de retroceso
        
        // Aplicar la apariencia global
        appearance.backButtonAppearance = backButtonAppearance
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }*/

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
