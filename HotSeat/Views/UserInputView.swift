//
//  UserInputView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct UserInputView: View {
    @Binding var state: GameState
    @State private var playerLabel = "Player 1"
    @State private var textContent: String = ""

    var body: some View {
        VStack {
            Text(playerLabel)
            Text("Please type your answer below")
            TextEditor(text: $textContent)
                        .foregroundColor(.secondary) // Set the text color
                        .padding() // Add some padding around the text editor
                        .border(Color.gray, width: 1) // Optional: Add a border
                        .padding() // Add padding around the border if added
            Button("Done") {
                state = .result
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
    }
}

struct UserInputView_Previews: PreviewProvider {
    @State static var state = GameState.setting

    static var previews: some View {
        UserInputView(state: $state)
    }
}
