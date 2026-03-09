//
//  ContentView.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct NavegadorBasico: View {
    
    @Environment(ControladorGeneral.self) var control
    
    init() {
        // color del fondo del tab bar
        UITabBar.appearance().backgroundColor = UIColor.azulSecundario
    }
    
    var body: some View {
        
        TabView {
            
            Tab("Mensajes", systemImage: "message") {
                NavigationStack{
                    PantallaBasica()
                }
            }
            .badge(control.mensajes.count)
            
            Tab("Agregar usuario", systemImage: "person.badge.plus") {
                Text("Pantalla de agregar usuario")
            }
            
            Tab("Cosas que tengo", systemImage: "smile") {
                Text("Pantalla de inventario")
            }
            
            Tab("Ultima cosa", systemImage: "message") {
                Text("Pantalla de cosa random")
            }
        }
        
        // color del icono y texto del tab seleccionado
        .tint(.white)
    }
}

#Preview {
    NavegadorBasico()
        .environment(ControladorGeneral())
}
