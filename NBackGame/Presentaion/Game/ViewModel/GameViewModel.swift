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
    
    let level: Int
    var actions: GameViewModelActions
    
    init(level: Int, actions: GameViewModelActions) {
        self.level = level
        self.actions = actions
    }
    
    @Published var positionClicked = false
    @Published var soundClicked = false
    @Published var currentItem: CurrentItem = CurrentItem.placeholder()
    @Published var currentRoundNumber = 0
    
    var history: [HistoryItem] = []
    var cellsCount: Int {
        return boardSize * boardSize
    }
    
    // TODO: fields to be injected
    let letters = "gmbpkldst"
    let roundDuration: Double = 3.2
    let maxRounds = 25
    let boardSize: Int = 3
    
    private var timer: Timer?
    
    // MARK: Public functions
    
    static func placeholder() -> GameViewModel {
        return GameViewModel(level: 0, actions: GameViewModelActions(finishGame: { _ in } ))
    }
    
    func startGame() {
        print("Start Game")
        currentRoundNumber = 0
        positionClicked = false
        soundClicked = false
        currentItem = CurrentItem.placeholder()
        history.removeAll()
        
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
        resetButtons()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if !skipSaving {
                self.addHistory(previousItem)
            }
            self.resetButtons()
            
            if self.currentRoundNumber >= self.maxRounds {
                print("currentRoundNumber: \(self.currentRoundNumber)")
                self.finishGame()
                return
            }
            self.currentItem = CurrentItem(position: Int.random(in: 0..<self.cellsCount), sound: String(self.letters.randomElement()!))
            self.currentRoundNumber += 1
            self.speak()
        }
    }
    
    private func resetButtons() {
        soundClicked = false
        positionClicked = false
    }
    
    private func finishGame() {
        timer?.invalidate()
        timer = nil
        actions.finishGame(history)
    }
    
    private func addHistory(_ currentItem: CurrentItem) {
        let historyItem = HistoryItem(position: currentItem.position, sound: currentItem.sound, positionClicked: positionClicked, soundClicked: soundClicked)
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
