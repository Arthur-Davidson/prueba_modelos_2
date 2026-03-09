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
                .foregroundStyle(Color.azulPrincipal)
            ZStack(alignment: .bottom)
            {
                Image("usuario")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(Circle())
                    .padding(.vertical, 30)   // arriba y abajo
                    .padding(.horizontal, 25) // izquierda y derecha
                HStack{
                    Text("\(usuario.apodo)")
                        .foregroundStyle(Color.azulPrincipal)
                        .fontWeight(.bold)
                    Circle()
                        .frame(width: 15)
                        .foregroundStyle(usuario.conectado ? Color.green : Color.red)
                }
            }

        }
        .padding(15)
        .background(Color.gris)
        .cornerRadius(25)
        
    }
}

#Preview {
    EtiquetaUsuarioPerfil(usuario: usuarios_falsos[0])
}
