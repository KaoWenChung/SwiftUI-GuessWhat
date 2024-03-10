//
//  Playground.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

final class GameSettingViewModel {}

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
                viewModel.generateUsers()
                viewModel.state = .typing
            }
            .applyButtonStyle()
            
        }
        .padding()
    }

    private func generateUsers() {
        var newUsers = [User]()
        for i in 1...(viewModel.selectedNumber) {
            newUsers.append(.init(id: "Player\(i)"))
        }
        viewModel.users = newUsers
    }
}

#if DEBUG
struct GameSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingView(viewModel: GameSessionViewModel())
    }
}
#endif
