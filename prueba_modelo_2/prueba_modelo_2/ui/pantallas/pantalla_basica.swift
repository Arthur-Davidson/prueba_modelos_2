//
//  pantalla_basica.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/2/26.
//

import SwiftUI

struct PantallaBasica: View {
    
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        
        VStack(spacing: 15){
            
            // BARRA SUPERIOR
            HStack{
                Image(systemName: "message.fill")
                
                Text("El Mezenyer")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            .background(Color.azulPrincipal)
            .foregroundStyle(.white)
            
            
            // Seccion Usuarios
            VStack(){
                
                Text("Usuarios")
                    .font(.headline)
                    .foregroundStyle(Color.azulPrincipal)
                    .padding(.horizontal)
                
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(controlador.usuarios) { usuario in
                            
                            NavigationLink{
                                PantallaUsuario(usuario: usuario)
                            }
                            label: {
                                EtiquetaUsuarioPerfil(usuario: usuario)
                                    .padding(5)
                            }
                            .buttonStyle(.plain)
                            
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // Seccion Mensajes
            VStack(){
                
                Text("Mensajes")
                    .font(.headline)
                    .foregroundStyle(Color.azulPrincipal)
                    .padding(.horizontal)
                
                ScrollView(.vertical){
                    LazyVStack{
                        
                        ForEach(controlador.mensajes) { mensaje in
                            
                            NavigationLink{
                                PantallaMensaje(mensaje: mensaje)
                            }
                            label: {
                                PrevistaMensaje(mensaje: mensaje)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 30)
                            }
                            
                        }
                    }
                }
            }
            
            // Botones de agregar mensaje y registrar usuario
            VStack(spacing: 10){
                
                Button{
                    controlador.agregar_mensajes()
                } label: {
                    
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Agregar mensaje")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.azulPrincipal)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                
                
                NavigationLink{
                    RegistrarUsuario()
                }
                label: {
                    Text("Registrar nuevo usuario")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gris)
                        .foregroundStyle(.azulPrincipal)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
            }
            .padding()
            .background(Color.azulSecundario)
            
        }
        .background(Color.gris)
    }
}

#Preview {
    NavigationStack {
        PantallaBasica()
    }
    .environment(ControladorGeneral())
}
