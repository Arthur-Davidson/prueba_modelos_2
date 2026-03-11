//
//  pantalla_mensaje.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/11/26.
//

import SwiftUI

struct PantallaMensaje: View {
    
    var mensaje: Mensaje
    
    @Environment(\.dismiss) var salir
    
    var body: some View {
        
        VStack(spacing: 0){
            
            // BARRA SUPERIOR
            HStack{
                
                Image("usuario")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Text(mensaje.id_usuario ?? "Usuario desconocido")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Circle()
                            .frame(width: 12)
                            .foregroundStyle(.green)
                    }
                    
                    Text("En línea")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.8))
                }
                
                Spacer()
            }
            .padding()
            .background(Color.azulPrincipal)
            
            
            // AREA DE CHAT
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Text(mensaje.texto)
                        .padding()
                        .foregroundStyle(Color.azulPrincipal)
                        .background(Color.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .shadow(radius: 3)
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gris)
            
            
            // BARRA INFERIOR
            HStack{
                
                Spacer()
            }
            .padding()
            .background(Color.azulPrincipal)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    PantallaMensaje(mensaje: mensajes_falsos[0])
}
