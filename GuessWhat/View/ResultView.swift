//
//  ResultView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: QuickGameSessionViewModel

    init(viewModel: QuickGameSessionViewModel) {
        self.viewModel = viewModel
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
                ForEach(viewModel.players, id: \.id) { player in
                    playerRow(for: player)
                }
            }
        }
    }

    private func playerRow(for player: Player) -> some View {
        HStack(alignment: .bottom,
               spacing: 0,
               content: {
            Text(player.id)
            ChatBubble(direction: .left) {
                Text(subContent(player))
                    .padding(.all, 20)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
            }
        })
    }

    private func subContent(_ player: Player) -> String {
        "\(player.content) \nnumber: \(player.numberOfSelected), \nvoteTo: \(player.selectPlayerID)"
    }
    private var actionButtons: some View {
        HStack {
            Button(CommonString.restart.text, action: handleActionButtonHandler)
            .applyButtonStyle()
            Spacer()
        }
    }

    private func handleActionButtonHandler() {
        viewModel.reset()
    }
}

#if DEBUG
//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView(viewModel: QuickGameSessionViewModel())
//    }
//}
#endif

/*
 struct ResultView: View {
     @ObservedObject var viewModel: QuickGameSessionViewModel
     private let isOrdered: Bool

     init(isOrdered: Bool, viewModel: QuickGameSessionViewModel) {
         self.viewModel = viewModel
         self.isOrdered = isOrdered
     }

     private var displayPlayers: [Player] {
         isOrdered ? viewModel.players : viewModel.shuffledPlayers
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
         HStack(alignment: .bottom,
                spacing: 0,
                content: {
             Text(isOrdered ? player.id : "😎")
             ChatBubble(direction: .left) {
                 Text(player.content)
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
             Button(CommonString.restart.text) {
                 viewModel.reset()
             }
             .applyButtonStyle()
         }
     }

     private var actionLabel: String {
         isOrdered ? CommonString.back.text : CommonString.answer.text
     }

     private func handleActionButtonHandler() {
         viewModel.state = isOrdered ? .randomResult : .orderResult
     }
 }

 #if DEBUG
 struct ResultView_Previews: PreviewProvider {
     static var previews: some View {
         ResultView(isOrdered: true, viewModel: QuickGameSessionViewModel())
     }
 }
 #endif

 */
