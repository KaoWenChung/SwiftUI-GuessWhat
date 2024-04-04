//
//  GameSessionViewModel.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

enum LocalGameState {
    case guide
    case setting
    case typing
    case randomResult
    case orderResult
    
}

final class QuickGameSessionViewModel: ObservableObject {
    @Published var state: LocalGameState = .setting
    @Published var players = [Player]()
    @Published var shuffledPlayers = [Player]()
    var selectedNumber: Int = 2
    let numberRange = 2...12
    var appVersion: String? {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String,
              let build = dictionary["CFBundleVersion"] as? String else { return nil }
        return "\(version) \(build)"
    }
}

extension QuickGameSessionViewModel {
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

