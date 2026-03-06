//
//  perfil_usuario_mini.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/6/26.
//

import SwiftUI
struct EtiquetaUsuarioPerfil: View {
    var usuario: Usuario
    
    var body: some View {
        VStack{
            Text("Esta conectado: ")
            ZStack(alignment: .bottom)
            {
                Image("imagen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(Circle())
                HStack{
                    Text("\(usuario.apodo)")
                        .foregroundStyle(Color.purple)
                    Circle()
                        .frame(width: 15)
                        .foregroundStyle(usuario.conectado ? Color.green : Color.red)
                }
            }

        }
        .padding(15)
        .background(Color.gray)
        .cornerRadius(25)
        
    }
}

#Preview {
    EtiquetaUsuarioPerfil(usuario: usuarios_falsos[0])
}
