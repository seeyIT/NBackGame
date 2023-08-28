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
    let gameCoordinator: GameCoordinator
    let musicService: MusicService
    
    init(gameCoordinator: GameCoordinator, musicService: MusicService) {
        self.gameCoordinator = gameCoordinator
        self.musicService = musicService
    }
    
    @Published var positionClicked = false
    @Published var soundClicked = false
    @Published var currentItem: CurrentGameItem = CurrentGameItem.placeholder()
    @Published var currentRoundNumber = 0
    
    var history: [HistoryItem] = []
    var cellsCount: Int {
        return boardSize * boardSize
    }
    private var gameStartTime: Int64 = 0
    private let synthesizer = AVSpeechSynthesizer()

    // TODO: fields to be injected
    let letters = "gmbpkldst"
    let roundDuration: Double = 3.2
    let maxRounds = 25
    let boardSize: Int = 3
    
    private var timer: Timer?
    
    // MARK: Public functions
    
    static func placeholder() -> GameViewModel {
        return GameViewModel(gameCoordinator: DefaultGameCoordinator(menuCoordinator: DefaultMenuCoordinator()), musicService: MusicService())
    }

    func startGame() {
        log("Game startGame")
        debugPrint("Start Game")
        musicService.stopBackgroundMusic()
        gameStartTime = getTimestamp()
        currentRoundNumber = 0
        positionClicked = false
        soundClicked = false
        currentItem = CurrentGameItem.placeholder()
        history.removeAll()
        
        timer = Timer.scheduledTimer(timeInterval: roundDuration, target: self, selector: #selector(nextRound), userInfo: nil, repeats: true)
        nextRound(skipSaving: true)
    }
    
    func selectPosition() {
        log("Game selectPosition")
        if positionClicked {
            return
        }
        log("Game position selected")
        positionClicked = true
    }
    
    func selectSound() {
        log("Game selectSound")
        if soundClicked {
            return
        }
        log("Game sound selected")
        soundClicked = true
    }
    
    func showMenu() {
        log("Game showMenu")
        stopTimer()
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
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func finishGame() {
        stopTimer()
        gameCoordinator.showGameSummary(history: history, gameStartTime: gameStartTime, gameEndTime: getTimestamp())
    }
    
    private func addHistory(_ currentGameItem: CurrentGameItem) {
        let historyItem = HistoryItem(roundNumber: currentRoundNumber, position: currentGameItem.position, sound: currentGameItem.sound, positionClicked: positionClicked, soundClicked: soundClicked)
        history.append(historyItem)
    }
    
    private func speak() {
        musicService.playLetter(currentItem.sound)
    }
}
