//
//  GameView.swift
//  GuessWhat
//
//  Created by wyn on 2024/4/4.
//

import SwiftUI

struct GameManagerView: View {
    @StateObject private var viewModel = GameManagerViewModel()

    var body: some View {
        let state = viewModel.state
        VStack {
            switch state {
            case .home:
                HomeView(viewModel: viewModel)
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .guide:
                LocalGameView()
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .areaConnect:
                LocalGameView()
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            case .quickGame:
                LocalGameView()
                    .transition(.slideAndFade(insertion: .bottom, removal: .top))
            }
        }
        .animation(.default, value: state)
    }
}

#if DEBUG
struct GameManagerView_Previews: PreviewProvider {
    static var previews: some View {
        GameManagerView()
    }
}
#endif

enum GameState {
    case home
    case areaConnect
    case quickGame
    case guide
}

final class GameManagerViewModel: ObservableObject {
    @Published var state: GameState = .home
    var appVersion: String? {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String,
              let build = dictionary["CFBundleVersion"] as? String else { return nil }
        return "\(version) \(build)"
    }
}
