//
//  User.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

struct User {
    let id: String
    private(set) var content: String = ""
    mutating func update(content: String) {
        self.content = content
    }
}
