//
//  GameSettingView.swift
//  GuessWhat
//
//  Created by wyn on 2024/3/11.
//

import SwiftUI

struct GameSettingView: View {
    enum GameSettingText: LocalizedStringType {
        case amountOfPlayers
        case selectNumber
    }
    @ObservedObject var viewModel: GameSessionViewModel
    @State private var textContent: String = ""

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    Text("Game Setting")
                        .font(.largeTitle)

                    Button(action: {
                        viewModel.state = .guide
                    }) {
                        Image(systemName: "questionmark.circle")
                            .font(.title)
                    }
                }
                .padding(.top)
                if let verision = viewModel.appVersion {
                    Text("version: \(verision)")
                }
                Spacer(minLength: 110)

                HStack {
                    Text(GameSettingText.amountOfPlayers.text)
                        .padding()
                        .font(.headline)

                    Picker(GameSettingText.selectNumber.text, selection: $viewModel.selectedNumber) {
                        ForEach(viewModel.numberRange, id: \.self) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Text("Question: ")
                    .padding()
                    .font(.headline)
                textEditor

                Button(CommonString.start.text) {
                    viewModel.generatePlayers()
                    viewModel.state = .typing
                }
                .applyButtonStyle()
                Spacer()
                
            }
            .padding()
        }
    }

    private var textEditor: some View {
        TextEditor(text: $textContent)
            .foregroundColor(.secondary)
            .padding()
            .border(Color.gray, width: 1)
            .padding()
    }

    private func generatePlayers() {
        var newPlayers = [Player]()
        for i in 1...(viewModel.selectedNumber) {
            let id = String(format: CommonString.player.text, i.description)
            newPlayers.append(.init(id: id))
        }
        viewModel.players = newPlayers
    }
}

#if DEBUG
struct GameSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingView(viewModel: GameSessionViewModel())
    }
}
#endif

struct HalfCircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // Start from the bottom center for a half circle that opens upwards
            let startAngle = Angle(degrees: 0)
            let endAngle = Angle(degrees: 180)
            
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.width / 2,
                        startAngle: startAngle,
                        endAngle: endAngle,
                        clockwise: false)
        }
    }
}
