//
//  Player.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

class Player {
    let id: String
    var content: String = ""
    var selectPlayerID: String = ""
    private(set) var numberOfSelected: Int = 0

    init(id: String) {
        self.id = id
    }
    
    func update(content: String) {
        self.content = content
    }

    func beVoted() {
        numberOfSelected += 1
    }
}
