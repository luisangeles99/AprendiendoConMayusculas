//
//  Tema.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 16/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import Foundation

struct Tema: Codable {
    let tema_ID : Int
    let nombre, norma: String
    let ejemplos: [ejemplo]
    let ejercicios: [ejercicio]
}

struct ejemplo: Codable {
    let ejemplo, justif: String
}

struct ejercicio: Codable {
    let pregunta: String
    let respuesta: Bool
}

