//
//  GameViewModel.swift
//  HotSeat
//
//  Created by wyn on 2024/3/10.
//

import SwiftUI

final class GameSessionViewModel: ObservableObject {
    @Published var state: GameState = .setting
    @Published var users = [User]()
    var selectedNumber: Int = 2
    let numberRange = 2...24
}

extension GameSessionViewModel {
    func reset() {
        state = .setting
        users.removeAll()
    }

    func generateUsers() {
        users = (1...selectedNumber).map { .init(id: "Player \($0)") }
    }
}
