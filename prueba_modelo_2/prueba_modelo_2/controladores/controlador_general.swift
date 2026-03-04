//
//  controlador_general.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/2/26.
//
import SwiftUI

@Observable
class ControladorGeneral {
    public var mensajes: [Mensaje]
    public var usuarios: [Usuario]
    
    init() {
        mensajes = []
        usuarios = []
    }
    
    func agregar_mensajes() {
        mensajes += [Mensaje(texto: "mensajes de: \(mensajes.count + 1)", id_usuario: nil)]
    }
    
    func agregar_usuarios( _ usuario_nuevo: Usuario) {
        usuarios.append(usuario_nuevo)
        
        print("La cantidad de usuarios es: \(usuarios.count)")
    }
    
}
