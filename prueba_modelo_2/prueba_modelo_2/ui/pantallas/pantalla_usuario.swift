//
//  pantalla_usuario.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/11/26.
//

import SwiftUI

struct PantallaUsuario: View {
    var usuario: Usuario
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Esta conectado:")
                .foregroundStyle(Color.azulPrincipal)
                .font(.title3)
            
            Image("usuario")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .padding(.vertical, 20)
            
            VStack{
                
                HStack{
                    Text(usuario.apodo)
                        .foregroundStyle(Color.azulPrincipal)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    
                    Circle()
                        .frame(width: 15)
                        .foregroundStyle(usuario.conectado ? Color.green : Color.red)
                }
                
                Text("Instagram: \(usuario.instagram)")
                    .foregroundStyle(Color.azulPrincipal)
                    .padding()
                    .frame(height: 30)
                    .overlay{
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.azulSecundario, lineWidth: 5)
                    }
                
                Text("Edad: \(usuario.edad)")
                    .foregroundStyle(Color.azulPrincipal)
                    .padding()
                    .frame(height: 30)
                    .overlay{
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.azulSecundario, lineWidth: 5)
                    }
            }
            
            Spacer()
            
            Button("Volver") {
                dismiss()
            }
            .padding(.horizontal, 80)
            .padding(.vertical,20)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .background(Color.azulPrincipal)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gris)
    }
}

#Preview {
    PantallaUsuario(usuario: usuarios_falsos[0])
}
