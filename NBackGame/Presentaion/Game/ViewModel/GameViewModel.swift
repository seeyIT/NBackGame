//
//  GameViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 21/10/2020.
//

import Foundation
import Combine
import AVFoundation

class GameViewModel: ObservableObject {
    let gameCoordinator: GameViewCoordinator
    let level: Int
    
    init(gameCoordinator: GameViewCoordinator, level: Int) {
        self.gameCoordinator = gameCoordinator
        self.level = level
    }
    
    @Published var positionClicked = false
    @Published var soundClicked = false
    @Published var currentItem: CurrentGameItem = CurrentGameItem.placeholder()
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
        return GameViewModel(gameCoordinator: GameViewCoordinator(menuCoordinator: MenuViewCoordinator(menuDIContainer: MenuDIContainer(), menuViewState: .init(.game)), gameDIContainer: GameDIContainer()), level: 0)
    }
    
    func startGame() {
        print("Start Game")
        currentRoundNumber = 0
        positionClicked = false
        soundClicked = false
        currentItem = CurrentGameItem.placeholder()
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
    
    func showMenu() {
        stopGame()
        gameCoordinator.showMenu()
    }
    
    // MARK: Private functions
    
    @objc private func nextRound(skipSaving: Bool) {
        let previousItem = currentItem
        currentItem = CurrentGameItem.placeholder()
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
            self.currentItem = CurrentGameItem(position: Int.random(in: 0..<self.cellsCount), sound: String(self.letters.randomElement()!))
            self.currentRoundNumber += 1
            self.speak()
        }
    }
    
    private func resetButtons() {
        soundClicked = false
        positionClicked = false
    }
    
    private func stopGame() {
        timer?.invalidate()
        timer = nil
    }
    
    private func finishGame() {
        stopGame()
        gameCoordinator.showGameSummary()
    }
    
    private func addHistory(_ currentGameItem: CurrentGameItem) {
        let historyItem = HistoryItem(position: currentGameItem.position, sound: currentGameItem.sound, positionClicked: positionClicked, soundClicked: soundClicked)
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
