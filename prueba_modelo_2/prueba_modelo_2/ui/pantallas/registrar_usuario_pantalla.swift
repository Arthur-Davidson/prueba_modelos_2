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
    @Environment(\.dismiss) var salir
    
    @State var nombre: String = ""
    @State var apodo: String = ""
    @State var edad: String = ""
    @State var instagram: String = ""
    
    @State var error: ErrorUI? = nil
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("Registrar Usuario")
                .font(.system(size: 26))
                .fontWeight(.bold)
                .foregroundStyle(Color.azulPrincipal)
            
            Image(systemName: "person.crop.circle.badge.plus")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .foregroundStyle(Color.azulPrincipal)
                .padding(.bottom, 20)
            
            VStack(spacing: 15){
                
                CampoTexto(
                    entrada: $nombre,
                    placeholder: "Nombre",
                    error: error,
                    id: CampoRegistrarUsuario.nombre.rawValue
                )
                
                CampoTexto(
                    entrada: $apodo,
                    placeholder: "Apodo",
                    error: error,
                    id: CampoRegistrarUsuario.apodo.rawValue
                )
                
                CampoTexto(
                    entrada: $edad,
                    placeholder: "Edad",
                    error: error,
                    id: CampoRegistrarUsuario.edad.rawValue
                )
                
                CampoTexto(
                    entrada: $instagram,
                    placeholder: "Instagram",
                    error: error,
                    id: CampoRegistrarUsuario.instagram.rawValue
                )
            }
            .padding()
            .background(Color.white)
            .cornerRadius(25)
            
            Button(action: {
                validar_entrada()
            }){
                HStack{
                    Text("Agregar usuario")
                        .fontWeight(.bold)
                    
                    Image(systemName: "person.fill.badge.plus")
                }
                .padding()
                .frame(width: 220)
                .background(Color.azulPrincipal)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.top,20)
            
            Button("Cancelar"){
                salir()
            }
            .foregroundStyle(Color.red)
            .padding(.top,10)
            
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gris)
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
        salir()
        
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
