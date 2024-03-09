//
//  AnyTransition.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

extension AnyTransition {
    static func slideAndFade(insertion insertionEdge: Edge, removal removalEdge: Edge) -> AnyTransition {
        let insertion = AnyTransition.move(edge: insertionEdge)
                            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: removalEdge)
                        .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
