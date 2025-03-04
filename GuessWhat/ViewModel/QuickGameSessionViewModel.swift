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
    case vote
    case voteResult
}

final class QuickGameSessionViewModel: ObservableObject {
    enum Constant {
        static let defaultNumber = 3
        static let maxNumber = 15
    }
    @Published var state: LocalGameState = .setting
    @Published var players = [Player]()
    @Published var shuffledPlayers = [Player]()
    @Published var selectedNumber: Int = Constant.defaultNumber
    @Published var currentPlayerIndex = 0 {
        didSet {
            if currentPlayerIndex == selectedNumber {
                state = .voteResult
            }
        }
    }
    var currentPlayerID: String {
        guard currentPlayerIndex < selectedNumber else { return "" }
        return players[currentPlayerIndex].id
    }
    let numberRange = Constant.defaultNumber...Constant.maxNumber
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
        selectedNumber = Constant.defaultNumber
        currentPlayerIndex = 0
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
        currentPlayerIndex += 1
    }
}

