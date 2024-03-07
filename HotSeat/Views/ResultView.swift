//
//  ResultView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct ResultView: View {
    @Binding var state: GameState
    var body: some View {
        VStack {
            Button("RESTART") {
                state = .setting
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    @State static var state = GameState.setting

    static var previews: some View {
        ResultView(state: $state)
    }
}
