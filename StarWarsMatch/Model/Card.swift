//
//  Card.swift
//  StarWarsMatch
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//

import Foundation

// Representa una carta individual en el juego
struct Card: Identifiable, Equatable {
    let id = UUID()  // Identificador único para cada carta
    let character: String  // El personaje de Star Wars en la carta
    let imageName: String  // El nombre de la imagen asociada al personaje
    var isFaceUp = false  // Indica si la carta está boca arriba
    var isMatched = false  // Indica si la carta ha sido emparejada
}

