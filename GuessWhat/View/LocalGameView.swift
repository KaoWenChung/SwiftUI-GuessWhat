//
//  LocalGameView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

struct LocalGameView: View {
    @StateObject private var viewModel = QuickGameSessionViewModel()

    var body: some View {
        let state = viewModel.state
        VStack {
            switch state {
            case .guide:
                GuideView(viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .setting:
                GameSettingView(viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .typing:
                UserInputView(viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .vote:
                VoteView(viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .voteResult:
                ResultView(viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .top, removal: .bottom))
                
            }
        }
        .animation(.default, value: state)
        .applyPagePadding()
    }
}

#if DEBUG
//struct LocalGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocalGameView()
//    }
//}
#endif
