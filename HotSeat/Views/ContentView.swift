//
//  ContentView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

enum GameState {
    case setting
    case typing
    case result
}

struct ContentView: View {
    @State private var state: GameState = .setting

    var body: some View {
        VStack {
            switch state {
            case .setting:
                GameSettingView(state: $state)
                    .transition(.slideAndFade)
            case .typing:
                UserInputView(state: $state)
                    .transition(.slideAndFade)
            case .result:
                ResultView(state: $state)
                    .transition(.slideAndFade)
            }
        }
        .animation(.default, value: state)
    }
}

#Preview {
    ContentView()
}
