//
//  ResultView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct ResultView: View {
    let isOrdered: Bool
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        VStack {
            let users = viewModel.users
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(isOrdered ? users : users.shuffled(), id: \.id) { user in
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
                }
            }
            HStack {
                Button(isOrdered ? "BACK" : "ANSWER") {
                    viewModel.state = isOrdered ? .randomResult : .orderResult
                }
                .applyButtonStyle()
                Spacer()
                Button("PLAY AGAIN") {
                    viewModel.state = .setting
                }
                .applyButtonStyle()
            }
        }
    }
    
}

#if DEBUG
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(isOrdered: true, viewModel: GameViewModel())
    }
}
#endif
