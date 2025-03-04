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
    case vote
    case voteResult
}

final class QuickGameSessionViewModel: ObservableObject {
    @Published var state: LocalGameState = .setting
    @Published var players = [Player]()
    @Published var shuffledPlayers = [Player]()
    @Published var selectedNumber: Int = 3
    @Published var currentPlayerIndex = 0 {
        didSet {
            if currentPlayerIndex == selectedNumber {
                didAllPlayerVoted = true
            }
        }
    }
    @Published var didAllPlayerVoted = false
    let numberRange = 3...15
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
        didAllPlayerVoted = false
    }

    func generatePlayers() {
        players = (1...selectedNumber).map { .init(id: "player_\($0)") }
    }

    func shufflePlayers() {
        shuffledPlayers = players.shuffled()
    }

    func vote(id: String) {
        players.first(where: { $0.id == id})?.beVoted()
        players[currentPlayerIndex].selectPlayerID = id
    }
}

