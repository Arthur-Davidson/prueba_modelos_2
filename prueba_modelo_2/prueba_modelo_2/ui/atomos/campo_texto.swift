//
//  campo.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/4/26.
//

import SwiftUI

struct CampoTexto: View {
    
    @Binding var entrada: String
    var placeholder: String
    var error: ErrorUI?
    var id: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4){
            
            TextField(placeholder, text: $entrada)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            if let error = error, error.campo == id {
                switch error.nivel_de_error {
                case .gravisimo:
                    Text(error.error)
                        .foregroundStyle(.red)
                        .font(.caption)
                case .advertencia:
                    Text(error.error)
                        .foregroundStyle(.yellow)
                        .font(.caption)
                case .bien:
                    EmptyView()
                }
            }
        }
    }
}

