//
//  ButtonStyleModifier.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
    }
}

// Extension to apply the View Modifier more easily
extension View {
    func applyButtonStyle() -> some View {
        self.modifier(ButtonStyleModifier())
    }
}
