//
//  perfil_usuario_mini.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/6/26.
//

import SwiftUI
import SwiftUI

struct EtiquetaUsuarioPerfil: View {
    
    var usuario: Usuario
    
    var body: some View {
        
        VStack(spacing: 8){
            
            Image("usuario")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            HStack(spacing: 6){
                
                Text(usuario.apodo)
                    .foregroundStyle(Color.gris)
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                
                Circle()
                    .frame(width: 10)
                    .foregroundStyle(usuario.conectado ? .green : .red)
                
            }
            
        }
        .padding(12)
        .background(Color.azulSecundario)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 3)
        
    }
}

#Preview {
    EtiquetaUsuarioPerfil(usuario: usuarios_falsos[0])
}
