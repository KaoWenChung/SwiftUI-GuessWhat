//
//  UserInputView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct UserInputView: View {
    @ObservedObject var viewModel: GameViewModel
    @State private var textContent: String = ""
    @State private var currentUserIndex: Int = 0

    private var playerLabel: String {
        return viewModel.users[currentUserIndex].id
    }

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
                    viewModel.state = .setting
                }
                .applyButtonStyle()
                Spacer()
                Button("DONE") {
                    viewModel.users[currentUserIndex].update(content: textContent)
                    textContent.removeAll()
                    if currentUserIndex == viewModel.users.count - 1{
                        viewModel.state = .randomResult
                    } else {
                        currentUserIndex += 1
                    }
                }
                .applyButtonStyle()
            }
        }
    }
}

#if DEBUG
struct UserInputView_Previews: PreviewProvider {

    static var previews: some View {
        UserInputView(viewModel: GameViewModel())
    }
}
#endif
