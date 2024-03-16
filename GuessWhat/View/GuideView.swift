//
//  GuideView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/16.
//

import SwiftUI

struct GuideView: View {
    @ObservedObject var viewModel: GameSessionViewModel
    var body: some View {
        VStack {
            Text("WIP!")
            
            Button(CommonString.back.text) {
                viewModel.state = .setting
            }
            .applyButtonStyle()
        }
    }
}

#if DEBUG
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(viewModel: GameSessionViewModel())
    }
}
#endif
