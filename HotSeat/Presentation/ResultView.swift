//
//  ResultView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: GameSessionViewModel
    let isOrdered: Bool

    init(isOrdered: Bool, viewModel: GameSessionViewModel) {
        self.viewModel = viewModel
        self.isOrdered = isOrdered
    }

    private var displayUsers: [User] {
        isOrdered ? viewModel.users : viewModel.users.shuffled()
    }

    var body: some View {
        VStack {
            userContent
            actionButtons
        }
    }

    private var userContent: some View {
        ScrollView {
            let users = viewModel.users
            VStack(spacing: 0) {
                ForEach(isOrdered ? users : users.shuffled(), id: \.id) { user in
                    userRow(for: user)
                }
            }
        }
    }

    private func userRow(for user: User) -> some View {
        HStack(alignment: .bottom,
               spacing: 0,
               content: {
            Text(isOrdered ? user.id : "😎")
            ChatBubble(direction: .left) {
                Text(user.content)
                    .padding(.all, 20)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
            }
        })
    }

    private var actionButtons: some View {
        HStack {
            Button(actionLabel, action: handleActionButtonHandler)
            .applyButtonStyle()
            Spacer()
            Button("PLAY AGAIN") {
                viewModel.reset()
            }
            .applyButtonStyle()
        }
    }

    private var actionLabel: String {
        isOrdered ? "BACK" : "ANSWER"
    }

    private func handleActionButtonHandler() {
        viewModel.state = isOrdered ? .randomResult : .orderResult
    }
}

#if DEBUG
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(isOrdered: true, viewModel: GameSessionViewModel())
    }
}
#endif
