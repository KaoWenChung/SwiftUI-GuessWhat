//
//  UserInputView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct UserInputView: View {
    @Binding var state: GameState
    @Binding var users: [User]
    private var playerLabel: String {
        return users[currentUserIndex].id
    }
    @State private var textContent: String = ""
    @State private var currentUserIndex: Int = 0

    var body: some View {
        VStack {
            Text(playerLabel)
            Text("Please type your answer below")
            TextEditor(text: $textContent)
                        .foregroundColor(.secondary)
                        .padding()
                        .border(Color.gray, width: 1)
                        .padding()
            HStack {
                Button("RESET") {
                    state = .setting
                }
                .applyButtonStyle()
                Spacer()
                Button("DONE") {
                    users[currentUserIndex].update(content: textContent)
                    textContent.removeAll()
                    if currentUserIndex == users.count - 1{
                        state = .randomResult
                    } else {
                        currentUserIndex += 1
                    }
                }
                .applyButtonStyle()
            }
        }
    }
}

struct UserInputView_Previews: PreviewProvider {
    @State static var state = GameState.setting
    @State static var users = [User]()

    static var previews: some View {
        UserInputView(state: $state, users: $users)
    }
}
