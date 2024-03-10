//
//  UserInputView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct UserInputView: View {
    @ObservedObject var viewModel: GameSessionViewModel
    @State private var textContent: String = ""
    @State private var currentUserIndex: Int = 0

    private var currentPlayerLabel: String {
        viewModel.users.indices.contains(currentUserIndex) ? viewModel.users[currentUserIndex].id : "Unknown Player"
    }

    private var isLastUser: Bool {
        currentUserIndex >= viewModel.users.count - 1
    }

    var body: some View {
        VStack {
            Text(currentPlayerLabel)
            instructionText
            textEditor
            actionButtons
            
        }
    }

    private var instructionText: some View {
        Text("Please type your answer below")
            .padding(.vertical)
    }

    private var textEditor: some View {
        TextEditor(text: $textContent)
            .foregroundColor(.secondary)
            .padding()
            .border(Color.gray, width: 1)
            .padding()
    }

    private var actionButtons: some View {
        HStack {
            Button("BACK") {
                viewModel.state = .setting
            }
            .applyButtonStyle()
            Spacer()
            Button(isLastUser ? "DONE" : "NEXT") {
                processUserInput()
            }
            .applyButtonStyle()
        }
    }

    private func processUserInput() {
        viewModel.users[currentUserIndex].update(content: textContent)
        textContent.removeAll()
        if isLastUser {
            // change the view to next page
            viewModel.state = .randomResult
        } else {
            // move to next user
            currentUserIndex += 1
        }
    }
}

#if DEBUG
struct UserInputView_Previews: PreviewProvider {

    static var previews: some View {
        UserInputView(viewModel: GameSessionViewModel())
    }
}
#endif
