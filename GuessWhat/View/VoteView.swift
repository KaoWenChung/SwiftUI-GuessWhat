//
//  VoteView.swift
//  GuessWhat
//
//  Created by wyn on 2025/3/4.
//

import SwiftUI

struct VoteView: View {
    @ObservedObject var viewModel: QuickGameSessionViewModel
    @State private var selectedPlayerID: String?

    init(viewModel: QuickGameSessionViewModel) {
        self.viewModel = viewModel
    }

    private var displayPlayers: [Player] {
        viewModel.shuffledPlayers
    }

    var body: some View {
        VStack {
            userContent
            actionButtons
        }
    }

    private var userContent: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(displayPlayers, id: \.id) { player in
                    playerRow(for: player)
                }
            }
        }
    }

    private func playerRow(for player: Player) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text("😎")
            ChatBubble(direction: .left, playerID: player.id) { id in
                if selectedPlayerID == id {
                    selectedPlayerID = nil
                } else {
                    selectedPlayerID = id
                }
            } content: {
                Text(player.content)
                    .padding(20)
                    .foregroundColor(.white)
                    .background(selectedPlayerID == player.id ? Color.green : Color.blue)
            }
        }
    }

    private var actionButtons: some View {
        HStack {
            
            Spacer()
            Button("Select", action: handleActionButtonHandler)
            .applyButtonStyle()
        }
    }

    private func handleActionButtonHandler() {
        guard let selectedPlayerID else { return }
        
        viewModel.vote(id: selectedPlayerID)
        self.selectedPlayerID = nil
    }
}
