//
//  ChatBubble.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

// reference: https://prafullkumar77.medium.com/swiftui-creating-a-chat-bubble-like-imessage-using-path-and-shape-67cf23ccbf62

import SwiftUI

struct ChatBubble<Content>: View where Content: View {
    let direction: ChatBubbleShape.Direction
    let content: () -> Content
    let playerID: String?
    let onTap: ((String) -> Void)?

    init(direction: ChatBubbleShape.Direction,
         playerID: String? = nil,
         onTap: ((String) -> Void)? = nil,
         @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.direction = direction
        self.playerID = playerID
        self.onTap = onTap
    }

    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            content()
                .clipShape(ChatBubbleShape(direction: direction))
                .onTapGesture {
                    onTap?(playerID ?? "")
                }
            if direction == .left {
                Spacer()
            }
        }
        .padding([(direction == .left) ? .leading : .trailing, .top, .bottom], 20)
        .padding((direction == .right) ? .leading : .trailing, 50)
    }
}

