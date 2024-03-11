//
//  Player.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

struct Player {
    let id: String
    private(set) var content: String = ""
    mutating func update(content: String) {
        self.content = content
    }
}
