//
//  pantalla_basica.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct PantallaBasica: View {
    //@State var mensajes: [String] = ["hola 1", "hola 2", "hola 3"]
    //@State var controlador = ControladorGeneral()
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        
        Spacer()
        
        VStack{
            Text("Esta pantalla me mueve a la siguiente opcion")
        }
        
        Spacer()
        ScrollView(.horizontal){
            LazyHStack{
                ForEach(controlador.usuarios) { usuario in
                    NavigationLink{
                        Text("Esta es la pantalla del \(usuario)")
                    }
                    label: {
                        EtiquetaUsuarioPerfil(usuario: usuario)
                            .padding(5)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        
        ScrollView(.vertical){
            LazyVStack{
                ForEach(controlador.mensajes) { mensaje in
                    NavigationLink{
                        Text("Esta es la pantalla del \(mensaje)")
                    }
                    label: {
                        PrevistaMensaje(mensaje: mensaje)
                            .padding(.vertical, 5)   // arriba y abajo
                            .padding(.horizontal, 25) // izquierda y derecha
                    }
                }
            }
        }
        
        Spacer()
        
        Text("Agregar un hola mundo")
            .onTapGesture {
                controlador.agregar_mensajes()
            }
        
        NavigationLink{
            RegistrarUsuario()
        }
        label: {
            Text("Pantalla a sobreponer")
        }
        
    }
}

#Preview {
    NavigationStack {
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
