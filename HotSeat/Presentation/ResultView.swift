//
//  ResultView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct ResultView: View {
    @Binding var state: GameState
    @Binding var users: [User]
    var content: String {
        let shuffleContent = users
            .map { $0.content }
            .shuffled()
            .joined(separator: "\n")
        return shuffleContent
    }
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(users.indices) { _ in
                        ChatBubble(direction: .left) {
                            Text("Hello!")
                                .padding(.all, 20)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                        }
                    }
                }
            }
            Button("RESTART") {
                state = .setting
            }
        }
    }
    
}

struct ResultView_Previews: PreviewProvider {
    @State static var state = GameState.setting
    @State static var users: [User] = [.init(id: "test1", content: "Wow"),
                                       .init(id: "test2", content: "Hi")]

    static var previews: some View {
        ResultView(state: $state, users: $users)
    }
}
