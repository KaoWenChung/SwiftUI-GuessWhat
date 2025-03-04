//
//  ChatBubbleDemo.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

// reference: https://prafullkumar77.medium.com/swiftui-creating-a-chat-bubble-like-imessage-using-path-and-shape-67cf23ccbf62

import SwiftUI

struct ChatBubbleDemo: View {
    @State private var selectedPlayerID: String?

    var body: some View {
        ScrollView {
            VStack {
                ChatBubble(direction: .left, playerID: "1") { id in
                    if selectedPlayerID == id {
                        selectedPlayerID = nil
                    } else {
                        selectedPlayerID = id
                    }
                } content: {
                    Text("Hello!")
                        .padding(.all, 20)
                        .foregroundColor(.white)
                        .background(selectedPlayerID == "1" ? Color.green : Color.blue)
                }

                ChatBubble(direction: .right, playerID: "2") { id in
                    if selectedPlayerID == id {
                        selectedPlayerID = nil
                    } else {
                        selectedPlayerID = id
                    }
                } content: {
                    Text("What's up!")
                        .padding(.all, 20)
                        .foregroundColor(.white)
                        .background(selectedPlayerID == "2" ? Color.green : Color.blue)
                }
            }
        }
    }
}


#if DEBUG
struct ChatBubbleDemo_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleDemo()
    }
}

#endif
