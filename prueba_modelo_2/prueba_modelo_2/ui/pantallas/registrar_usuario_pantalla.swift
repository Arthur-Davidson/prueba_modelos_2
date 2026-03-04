//
//  registrar_usuario_pantalla.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

enum CampoRegistrarUsuario: String {
    case nombre = "nombre"
    case apodo = "apodo"
    case edad = "edad"
    case instagram = "instagram"
}

struct RegistrarUsuario: View {
    @Environment(ControladorGeneral.self) var controlador
    
    @State var nombre: String = ""
    @State var apodo: String = ""
    @State var edad: String = ""
    @State var instagram: String = ""
    
    @State var error: ErrorUI? = nil
    
    var body: some View {
        if(error != nil){
            Text("Hay un error, favor de resolverlo")
        }
        
        VStack{
            //TextField("Nombre", text: $nombre)
            CampoTexto(
                entrada: $nombre,
                placeholder: "Nombre",
                error: error,
                id: CampoRegistrarUsuario.nombre.rawValue
            )
            
            //TextField("Apodo", text: $apodo)
            CampoTexto(
                entrada: $apodo,
                placeholder: "Apodo",
                error: error,
                id: CampoRegistrarUsuario.apodo.rawValue
            )
            
            //TextField("Edad", text: $edad)
            CampoTexto(
                entrada: $edad,
                placeholder: "edad",
                error: error,
                id: CampoRegistrarUsuario.edad.rawValue
            )
            
            //TextField("Instagram", text: $instagram)
            CampoTexto(
                entrada: $instagram,
                placeholder: "Instagram",
                error: error,
                id: CampoRegistrarUsuario.instagram.rawValue
            )
            
            Button(action: {
                validar_entrada()
            }){
                HStack{
                    Text("Agregar usuario")
                    Image(systemName: "person.fill.badge.plus")
                }
            }
        }
        .padding()
    }

    func validar_entrada(){
        if(nombre.isEmpty){
            error = ErrorUI(
                campo: CampoRegistrarUsuario.nombre.rawValue,
                error: "No ha ingresado su nombre",
                nivel_de_error: .gravisimo
            )
            return
        }
        
        if(apodo.isEmpty){
            error = ErrorUI(
                campo: CampoRegistrarUsuario.apodo.rawValue,
                error: "No ha ingresado un apodo",
                nivel_de_error: .gravisimo
            )
            return
        }
        
        if(edad.isEmpty){
            error = ErrorUI(
                campo: CampoRegistrarUsuario.edad.rawValue,
                error: "No ha ingresado su edad",
                nivel_de_error: .gravisimo
            )
            return
        }
        
        if(instagram.isEmpty){
            error = ErrorUI(
                campo: CampoRegistrarUsuario.instagram.rawValue,
                error: "No ingreso su instagram",
                nivel_de_error: .gravisimo
            )
        }
        
        controlador.agregar_usuarios(crear_usuario())
        
        apodo = ""
        nombre = ""
        edad = ""
        instagram = ""
    }
    

    func crear_usuario() -> Usuario{
        return Usuario(
            nombre: nombre,
            edad: Int(edad)!,
            apodo: apodo,
            instagram: instagram)
    }
}

#Preview {
    RegistrarUsuario()
        .environment(ControladorGeneral())
}
