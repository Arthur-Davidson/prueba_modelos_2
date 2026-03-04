//
//  error_en_campo_ui.swift
//  prueba_modelo_2
//
//  Created by alumno on 3/4/26.
//

enum NivelesDeError{
    case gravisimo
    case advertencia
    case bien
}

struct ErrorUI{
    let campo: String
    let error: String
    let nivel_de_error: NivelesDeError
}
