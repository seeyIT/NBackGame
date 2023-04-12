//
//  TutorialSteps.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 07/12/2020.
//

import SwiftUI

struct TutorialStep1: View {
    var body: some View {
        TutorialText("Dual N-Back is a game with square board divided smaller squeres, by default it's 3x3.")
        
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: -1)
            .frame(width: 200, height: 200)
        TutorialText("Below the board there are two buttons: Position and Sound.")
        GameBottomPanel(viewModel: GameViewModel.placeholder())
            .scaleEffect(0.8)
            .disabled(true)
        TutorialText("On each round one of the squares is selected and one letter is spoken. Your job is to decide if position or sound or both was/were the same N round(s) ago. Let's see example on next screen...")
        
    }
}

/// nBack = 1

struct TutorialStep2: View {
    var body: some View {
        TutorialText("Let's assume that N is equal 1 and focus only on positions. This is the first round, so you can't compare it with previous but you need to remember its position. It's right upper corner.")
        
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
        MainBoard(boardSize: 3, cellsCount: 9, currentItemPosition: 2)
            .frame(width: 200, height: 200)
    }
}

/// nBack = 2

struct TutorialStep6: View {
    var body: some View {
        TutorialText("Now let's say N is equal 2. So you need to compare current position with two rounds ago. In the first round you just rember, center this time.")
        
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
        
        
    }
}


