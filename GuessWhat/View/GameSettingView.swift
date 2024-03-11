//
//  GameSettingView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

struct GameSettingView: View {
    @ObservedObject var viewModel: GameSessionViewModel

    var body: some View {
        VStack {
            Text("Amount of Players 🤓")
                .padding()
                .font(.headline)

            Picker("Select a number", selection: $viewModel.selectedNumber) {
                ForEach(viewModel.numberRange, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
            .pickerStyle(.inline)
            
            
            Button("START") {
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
            newPlayers.append(.init(id: "Player\(i)"))
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

