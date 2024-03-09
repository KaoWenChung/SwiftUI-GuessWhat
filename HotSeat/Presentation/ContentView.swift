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
    case randomResult
    case orderResult
    
}

struct ContentView: View {
    @State private var state: GameState = .setting
    @State private var users: [User] = []

    var body: some View {
        VStack {
            switch state {
            case .setting:
                GameSettingView(state: $state, users: $users)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .typing:
                UserInputView(state: $state, users: $users)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .randomResult:
                ResultView(isOrdered: false, state: $state, users: $users)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .orderResult:
                ResultView(isOrdered: true, state: $state, users: $users)
                    .transition(.slideAndFade(insertion: .top, removal: .bottom))
                
            }
        }
        .animation(.default, value: state)
    }
}

#Preview {
    ContentView()
}
