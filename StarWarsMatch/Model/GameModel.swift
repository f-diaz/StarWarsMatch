//
//  GameModel.swift
//  StarWarsMatch
//
//  Created by Fernando Diaz de Tudela on 20/7/24.
//

import Foundation

// Modelo del juego que solo contiene datos
struct GameModel {
    var cards: [Card]  // Colección de cartas en el juego
    var score: Int  // Puntuación actual del jugador
    var moves: Int  // Número de movimientos realizados
}
