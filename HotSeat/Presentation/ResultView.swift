//
//  ResultView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct ResultView: View {
    let isOrdered: Bool
    @Binding var state: GameState
    @Binding var users: [User]
    var body: some View {
        VStack {
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
                Button(isOrdered ? "Back" : "ANSWER") {
                    state = isOrdered ? .randomResult : .orderResult
                }
                .applyButtonStyle()
                Spacer()
                Button("RESTART") {
                    state = .setting
                }
                .applyButtonStyle()
            }
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }
    
}

struct ResultView_Previews: PreviewProvider {
    @State static var state = GameState.setting
    @State static var users: [User] = [.init(id: "test1", content: "Wow"),
                                       .init(id: "test2", content: "Hi")]

    static var previews: some View {
        ResultView(isOrdered: false, state: $state, users: $users)
    }
}
