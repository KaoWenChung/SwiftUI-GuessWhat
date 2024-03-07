//
//  ContentView.swift
//  HotSeat
//
//  Created by wyn on 2024/3/7.
//

import SwiftUI

struct ContentView: View {
    @State private var playerAmount = ""

    var body: some View {
        NavigationView {
                    VStack {
                        // This NavigationLink activates when the button is tapped
                        NavigationLink(destination: PlaygroundView()) {
                            Text("Go to Detail Page")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .navigationTitle("Main Page")
                    }
                }
//        VStack {
//            Text("Hello, welcome to the Hot Seat! 🤓")
//                .padding()
//                .font(.headline)
//
//            TextField("Number of players", text: $playerAmount)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .border(Color.gray)
//                            .frame(width: 150)
//                            .keyboardType(.numberPad)
//            
//            Button("START") {
//                print("Did press START ")
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.blue)
//            .cornerRadius(8)
//            
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
