//
//  UserInputView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

struct UserInputView: View {
    enum UserInputViewText: LocalizedStringType {
        case unknownPlayer
        case instruction
    }
    @ObservedObject var viewModel: QuickGameSessionViewModel
    @State private var textContent: String = ""
    @State private var currentUserIndex: Int = 0

    private var currentPlayerLabel: String {
        viewModel.players.indices.contains(currentUserIndex) ? viewModel.players[currentUserIndex].id : UserInputViewText.unknownPlayer.text
    }

    private var isLastUser: Bool {
        currentUserIndex >= viewModel.players.count - 1
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
        Text(UserInputViewText.instruction.text)
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
            Button(CommonString.back.text) {
                viewModel.state = .setting
            }
            .applyButtonStyle()
            Spacer()
            Button(isLastUser ? CommonString.done.text : CommonString.next.text) {
                processUserInput()
            }
            .applyButtonStyle()
        }
    }

    private func processUserInput() {
        viewModel.players[currentUserIndex].update(content: textContent)
        textContent.removeAll()
        if isLastUser {
            // change the view to next page
            viewModel.state = .randomResult
            viewModel.shufflePlayers()
        } else {
            // move to next user
            currentUserIndex += 1
        }
    }
}

#if DEBUG
struct UserInputView_Previews: PreviewProvider {

    static var previews: some View {
        UserInputView(viewModel: QuickGameSessionViewModel())
    }
}
#endif

