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
            Text(content)
                .foregroundColor(.white)
                .padding()
                .background(Color.teal)
                .cornerRadius(10)
            Button("RESTART") {
                state = .setting
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    @State static var state = GameState.setting
    @State static var users = [User]()

    static var previews: some View {
        ResultView(state: $state, users: $users)
    }
}
