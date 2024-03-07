//
//  AnyTransition.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

extension AnyTransition {
    static var slideAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .bottom)
                            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .top)
                        .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
