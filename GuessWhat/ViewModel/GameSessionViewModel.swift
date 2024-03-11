//
//  GameSessionViewModel.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

enum GameState {
    case setting
    case typing
    case randomResult
    case orderResult
    
}

final class GameSessionViewModel: ObservableObject {
    @Published var state: GameState = .setting
    @Published var players = [Player]()
    @Published var shuffledPlayers = [Player]()
    var selectedNumber: Int = 2
    let numberRange = 2...24
}

extension GameSessionViewModel {
    func reset() {
        state = .setting
        players.removeAll()
        shuffledPlayers.removeAll()
    }

    func generatePlayers() {
        players = (1...selectedNumber).map { .init(id: "Player \($0)") }
    }

    func shufflePlayers() {
        shuffledPlayers = players.shuffled()
    }
}

