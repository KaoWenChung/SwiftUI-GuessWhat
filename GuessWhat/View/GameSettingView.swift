//
//  GameSettingView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

struct GameSettingView: View {
    enum GameSettingText: LocalizedStringType {
        case amountOfPlayers
        case selectNumber
    }
    @ObservedObject var viewModel: GameSessionViewModel

    var body: some View {
        VStack {
            Text(GameSettingText.amountOfPlayers.text)
                .padding()
                .font(.headline)

            Picker(GameSettingText.selectNumber.text, selection: $viewModel.selectedNumber) {
                ForEach(viewModel.numberRange, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
            .pickerStyle(.inline)
            
            
            Button(CommonString.start.text) {
                viewModel.generatePlayers()
                viewModel.state = .typing
            }
            .applyButtonStyle()
            
        }
        .padding()
    }

    private func generatePlayers() {
        var newPlayers = [Player]()
        for i in 1...(viewModel.selectedNumber) {
            let id = String(format: CommonString.player.text, i.description)
            newPlayers.append(.init(id: id))
        }
        viewModel.players = newPlayers
    }
}

#if DEBUG
struct GameSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingView(viewModel: GameSessionViewModel())
    }
}
#endif

