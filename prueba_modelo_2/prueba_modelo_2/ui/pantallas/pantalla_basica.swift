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
        Text("Esta pantalla me mueve a la siguiente opcion")
        
        Spacer()
        
        ForEach(controlador.mensajes) { mensaje in
            NavigationLink{
                Text("Esta es la pantalla del \(mensaje)")
            }
            label: {
                Text("Aqui pulsa el usuario para ver el mensaje: \(mensaje.texto)")
            }
        .onAppear {
            print("Hola,soy la vista de: \(mensaje)")
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
