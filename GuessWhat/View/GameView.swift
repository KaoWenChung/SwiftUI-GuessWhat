//
//  GameView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameSessionViewModel()

    var body: some View {
        let state = viewModel.state
        VStack {
            
            switch state {
            case .setting:
                GameSettingView(viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .typing:
                UserInputView(viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .randomResult:
                ResultView(isOrdered: false, viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .orderResult:
                ResultView(isOrdered: true, viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .top, removal: .bottom))
                
            }
        }
        .animation(.default, value: state)
        .applyPagePadding()
    }
}

#if DEBUG
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
#endif
