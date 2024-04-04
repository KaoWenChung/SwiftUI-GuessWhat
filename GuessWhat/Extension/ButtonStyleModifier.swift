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
            .foregroundColor(.moonstone)
            .background(Color.alabaster)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.moonstone
                            , lineWidth: 1)
            )
    }
}

// Extension to apply the View Modifier more easily
extension View {
    func applyButtonStyle() -> some View {
        self.modifier(ButtonStyleModifier())
    }
}

