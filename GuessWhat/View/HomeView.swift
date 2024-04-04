//
//  HomeView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/30.
//

import SwiftUI

struct HomeView: View {
    enum HomeViewText: LocalizedStringType {
        case quickStart
        case areaConnect
    }
    @ObservedObject var viewModel: GameManagerViewModel
    @State private var textContent: String = ""

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    Text("Guess What?")
                        .font(.largeTitle)
                        .fontWeight(.bold)


                    Button(action: {
                        viewModel.state = .guide
                    }) {
                        Image(systemName: "questionmark.circle")
                            .tint(.moonstone)
                    }
                }

                if let verision = viewModel.appVersion {
                    Text("version: \(verision)")
                }

                Divider()
                Spacer()

                Button(HomeViewText.quickStart.text) {
                    viewModel.state = .quickGame
                }
                .frame(maxWidth: .infinity)
                .applyButtonStyle()

                Button(HomeViewText.areaConnect.text) {
                    viewModel.state = .areaConnect
                }
                .frame(maxWidth: .infinity)
                .applyButtonStyle()

                Button("How To Play") {
                    viewModel.state = .guide
                }
                .frame(maxWidth: .infinity)
                .applyButtonStyle()
                Spacer()
            }
            .padding()
        }
        .background(Color.alabaster)
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: GameManagerViewModel())
    }
}
#endif
