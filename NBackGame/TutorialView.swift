//
//  TutorialView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 19/11/2020.
//

import SwiftUI

struct TutorialView: View {
    @ObservedObject var viewModel: TutorialViewModel
    var steps: [Int: AnyView] = [
        1: AnyView(TutorialStep1()),
        2: AnyView(TutorialStep2()),
        3: AnyView(TutorialStep3()),
        4: AnyView(TutorialStep4()),
        5: AnyView(TutorialStep5()),
        6: AnyView(TutorialStep6()),
        7: AnyView(TutorialStep7()),
        8: AnyView(TutorialStep8()),
        9: AnyView(TutorialStep9()),
        10: AnyView(TutorialStep10()),
    ]
    var body: some View {
        ScrollView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Spacer()
                    steps[viewModel.currentStep]
                    Spacer()
                    TutorialNavigationView(viewModel: viewModel)
                }
                
            }
        }
        .navigationBarHidden(true)
        
    }
}

struct TutorialText: View {
    init(_ text: String) {
        self.text = text
    }
    
    private let text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .foregroundColor(.white)
            .padding()
    }
}

struct TutorialStep1: View {
    var body: some View {
        TutorialText("Dual N-Back is a game with square board divided smaller squeres, by default it's 3x3.")
        
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: -1)
            .frame(width: 200, height: 200)
        TutorialText("Below the board there are two buttons: Position and Sound.")
        GameBottomPanel(viewModel: GameViewModel())
            .scaleEffect(0.8)
            .disabled(true)
        TutorialText("On each round one of the squares is selected and one letter is spoken. Your job is to decide if position or sound or both was/were the same N round(s) ago. Let's see example on next screen...")
        
    }
}

/// nBack = 1

struct TutorialStep2: View {
    var body: some View {
        TutorialText("Let's assume that N is equal 1 and focus only on positions. This is the first round, so you can't compare it with previous but you need to remeber its position. It's right upper corner.")
        
        HStack {
            Text("N: 1")
                .font(.largeTitle)
                .foregroundColor(.blue)
            Spacer()
            Text("Round: 1/4")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 2)
            .frame(width: 200, height: 200)
        
    }
}
struct TutorialStep3: View {
    var body: some View {
        TutorialText("Round 2. Now position is left upper corner. N is equal to 1 so you need to remeber only previous position. Was the previous left upper corner? It wasn't, it was right upper corner, so you don't press Position button.")
        
        HStack {
            Text("N: 1")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            Text("Round: 2/4")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 0)
            .frame(width: 200, height: 200)
        
    }
}

struct TutorialStep4: View {
    var body: some View {
        TutorialText("Round 3. Now position is again right upper corner. N is equal to 1, so check only last one. Was it right upper corner? It wasn't it was left upper corner, so you don't press Position button.")
        
        HStack {
            Text("N: 1")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            Text("Round: 3/4")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 2)
            .frame(width: 200, height: 200)
    }
}

struct TutorialStep5: View {
    var body: some View {
        TutorialText("Round 4. Now position is again right upper corner. N is equal to 1, so check only last one. Was it right upper corner? It was, so you press Position button.")
        
        HStack {
            Text("N: 1")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            Text("Round: 4/4")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 0)
            .frame(width: 200, height: 200)
    }
}

/// nBack = 2

struct TutorialStep6: View {
    var body: some View {
        TutorialText("Now let's say N is equal 2. So you need to compar current position with two rounds ago. In the first round you just rember, center this time.")
        
        HStack {
            Text("N: 2")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            Text("Round: 1/5")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 4)
            .frame(width: 200, height: 200)
        
    }
}

struct TutorialStep7: View {
    var body: some View {
        TutorialText("The second round. Do you compare it the previous? No, you don't because N is equal to 2. This round you also only remeber position.")
        
        HStack {
            Text("N: 2")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            Text("Round: 2/5")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 8)
            .frame(width: 200, height: 200)
        
    }
}

struct TutorialStep8: View {
    var body: some View {
        TutorialText("The third round. Now, you need to compare current position with the position from the first round. What it the same? No, in the first round position was center.")
        
        HStack {
            Text("N: 2")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            Text("Round: 3/5")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 1)
            .frame(width: 200, height: 200)
        
    }
}

struct TutorialStep9: View {
    var body: some View {
        TutorialText("Now, you need to compare current position with the position from the second round. What it the same? No, not it's right center, and there was bottom right")
        
        HStack {
            Text("N: 2")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            Text("Round: 4/5")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 5)
            .frame(width: 200, height: 200)
        TutorialText("Do you see what is difficult in this game? Everytime N is increading the game becoming harder and harder.")
            .padding()
    }
}

struct TutorialStep10: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        TutorialText("Do you remeber position from the third round? Yes, it's the same, this in the only one round when you should press Position button.")
        
        HStack {
            Text("N: 2")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            Spacer()
            Text("Round: 5/5")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
        }
        .scaleEffect(0.5, anchor: .bottom)
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 1)
            .frame(width: 200, height: 200)
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            ZStack {
                PlayCircle()
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                VStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                        .padding(.bottom, 4)
                    Text("Back to Menu")
                        .foregroundColor(.blue)
                        .padding(.horizontal, 2)
                }
                
            }
            .frame(width: 120, height: 120)
            .padding()
        })
    }
}

struct TutorialNavigationView: View {
    @ObservedObject var viewModel: TutorialViewModel
    var body: some View {
        HStack {
            if viewModel.currentStep != viewModel.firstStep {
                Spacer()
                Button(action: {
                    withAnimation {
                        viewModel.previousStep()
                        
                    }
                }, label: {
                    ZStack {
                        PlayCircle()
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        VStack {
                            Image(systemName: "arrow.left")
                                .font(.largeTitle)
                                .padding(0)
                            Text("Back")
                                .foregroundColor(.blue)
                                .padding(0)
                        }
                        
                    }
                    .frame(width: 100, height: 100)
                })
                Spacer()
            }
            if viewModel.currentStep != viewModel.lastStep {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        viewModel.nextStep()
                    }
                }, label: {
                    ZStack {
                        PlayCircle()
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        VStack {
                            Image(systemName: "arrow.right")
                                .font(.largeTitle)
                                .padding(0)
                            Text("Next")
                                .foregroundColor(.blue)
                                .padding(0)
                        }
                        
                    }
                    .frame(width: 100, height: 100)
                })
                Spacer()
                
            }
            
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(viewModel: TutorialViewModel())
    }
}
