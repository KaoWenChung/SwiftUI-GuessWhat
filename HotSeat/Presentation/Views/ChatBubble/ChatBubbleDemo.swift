//
//  UserBubbleView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/8.
//

// reference: https://prafullkumar77.medium.com/swiftui-creating-a-chat-bubble-like-imessage-using-path-and-shape-67cf23ccbf62

import SwiftUI

struct ChatBubbleDemo: View {
    var body: some View {
        ScrollView {
            VStack {
                ChatBubble(direction: .left) {
                    Text("Hello!")
                        .padding(.all, 20)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
                ChatBubble(direction: .right) {
                    Text("What's up!")
                        .padding(.all, 20)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
            }
        }
    }
}

struct ChatBubbleDemo_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleDemo()
    }
}
