//
//  prueba_modelo_2App.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/2/26.
//
//

import SwiftUI

@main
struct PruebaModelo2App: App {
    
    @State var controlador = ControladorGeneral()
    
    var body: some Scene {
        WindowGroup {
            NavegadorBasico()
                .environment(controlador)
        }
    }
}
