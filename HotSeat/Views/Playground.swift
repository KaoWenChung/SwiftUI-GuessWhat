//
//  Playground.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct PlaygroundView: View {
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
                print("Did press START ")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
            
        }
        .padding()
    }
}

#Preview {
    PlaygroundView()
}
