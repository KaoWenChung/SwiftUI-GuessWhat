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
    @State private var users: [User] = []

    var body: some View {
        VStack {
            switch state {
            case .setting:
                GameSettingView(state: $state, users: $users)
                    .transition(.slideAndFade)
            case .typing:
                UserInputView(state: $state, users: $users)
                    .transition(.slideAndFade)
            case .result:
                ResultView(state: $state, users: $users)
                    .transition(.slideAndFade)
            }
        }
        .animation(.default, value: state)
    }
}

#Preview {
    ContentView()
}
