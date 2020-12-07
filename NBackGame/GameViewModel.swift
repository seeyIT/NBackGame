//
//  GameViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 21/10/2020.
//

import Foundation
import Combine
import AVFoundation

struct HistoryItem {
    let position: Int
    let sound: String
    let positionClicked: Bool
    let soundClicked: Bool
}

struct CurrentItem {
    let position: Int
    let sound: String
    
    static func placeholder() -> CurrentItem {
        return CurrentItem(position: -1, sound: "")
    }
}

class GameViewModel: ObservableObject {
    
    @Published var positionClicked = false
    @Published var soundClicked = false
    @Published var currentItem: CurrentItem = CurrentItem.placeholder()
    @Published var currentRoundNumber = 0
    @Published var nextScreen = false {
        didSet {
            print("old value: \(oldValue), \(nextScreen)")
        }
    }
    
    var history: [HistoryItem] = []
    var cellsCount: Int {
        return boardSize * boardSize
    }
    
    // TODO: fields to be injected
    let letters = "gmbpkldst"
    let roundDuration: Double = 3.2
    let maxRounds = 25
    let nBack = 2
    let boardSize: Int = 3
    
    private var timer: Timer?
    
    // MARK: Public functions
    
    func startGame() {
        print("Start Game")
        currentRoundNumber = 0
        positionClicked = false
        soundClicked = false
        currentItem = CurrentItem.placeholder()
        history.removeAll()
        nextScreen = false
        
        timer = Timer.scheduledTimer(timeInterval: roundDuration, target: self, selector: #selector(nextRound), userInfo: nil, repeats: true)
        nextRound(skipSaving: true)
    }
    
    func selectPosition() {
        if positionClicked {
            return
        }
        positionClicked = true
    }
    
    func selectSound() {
        if soundClicked {
            return
        }
        soundClicked = true
    }
    
    // MARK: Private functions
    
    @objc private func nextRound(skipSaving: Bool) {
        let previousItem = currentItem
        currentItem = CurrentItem.placeholder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if !skipSaving {
                self.addHistory(previousItem)
            }
            if self.currentRoundNumber >= self.maxRounds {
                self.finishRound()
                return
            }
            
            self.currentItem = CurrentItem(position: Int.random(in: 0..<self.cellsCount), sound: String(self.letters.randomElement()!))
            print("current item: \(self.currentItem)")
            self.currentRoundNumber += 1
            self.soundClicked = false
            self.positionClicked = false
            self.speak()
        }
    }
    
    private func finishRound() {
        timer?.invalidate()
        timer = nil
        print("finish")
        print("History: \(history)")
        nextScreen = true
    }
    
    private func addHistory(_ currentItem: CurrentItem) {
        /// TODO something is wrong here
        let historyItem = HistoryItem(position: currentItem.position, sound: currentItem.sound, positionClicked: positionClicked, soundClicked: soundClicked)
        print("add historyItem: \(historyItem)")
        history.append(historyItem)
    }
    
    private func speak() {
        print("speak")
        let utterance = AVSpeechUtterance(string: currentItem.sound)
        utterance.voice = AVSpeechSynthesisVoice(language: "en")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
}
