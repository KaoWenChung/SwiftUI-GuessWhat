//
//  UIColor+.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/30.
//

import SwiftUI

extension Color {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) -> Color {
        Color.init(red: r/255, green: g/255, blue: b/255, opacity: a)
    }

    static let tomato = rgb(r: 254, g: 74, b: 73)
    static let alabaster = rgb(r: 233, g: 235, b: 221)
    static let moonstone = rgb(r: 0, g: 159, b: 183)
    static let pomppower = rgb(r: 136, g: 90, b: 137)
}
