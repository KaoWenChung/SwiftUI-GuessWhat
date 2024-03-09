//
//  Playground.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct GameSettingView: View {
    @Binding var state: GameState
    @Binding var users: [User]
    @State private var selectedNumber: Int = 2
    @State private var numbersRange = 2...24
    

    var body: some View {
        VStack {
            Text("Amount of Players 🤓")
                .padding()
                .font(.headline)

            Picker("Select a number", selection: $selectedNumber) {
                    ForEach(numbersRange, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
            .pickerStyle(.inline)
            
            
            Button("START") {
                print(selectedNumber)
                generateUsers()
                state = .typing
            }
            .applyButtonStyle()
            
        }
        .padding()
    }

    private func generateUsers() {
        var newUsers = [User]()
        print(selectedNumber)
        for i in 1...(selectedNumber) {
            newUsers.append(.init(id: "Player\(i)"))
        }
        users = newUsers
    }
}

struct GameSettingView_Previews: PreviewProvider {
    @State static var state = GameState.setting
    @State static var users = [User]()

    static var previews: some View {
        GameSettingView(state: $state, users: $users)
    }
}
