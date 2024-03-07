//
//  Playground.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct GameSettingView: View {
    @Binding var state: GameState
    @State private var playerAmount = ""
    
    var body: some View {
        VStack {
            Text("Hello, welcome to the Hot Seat! 🤓")
                .padding()
                .font(.headline)

            TextField("Number of players", text: $playerAmount)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .border(Color.gray)
                            .frame(width: 150)
                            .keyboardType(.numberPad)
            
            Button("START") {
                state = .typing
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
            
        }
        .navigationTitle("Wow")
        .padding()
    }
}

struct GameSettingView_Previews: PreviewProvider {
    @State static var state = GameState.setting

    static var previews: some View {
        GameSettingView(state: $state)
    }
}
