//
//  PagePaddingModifier.swift
//  HotSeat
//
//  Created by wyn on 2024/3/9.
//

import SwiftUI

struct PagePaddingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 24)
            .padding(.trailing, 24)
    }
}

// Extension to apply the View Modifier more easily
extension View {
    func applyPagePadding() -> some View {
        self.modifier(PagePaddingModifier())
    }
}
