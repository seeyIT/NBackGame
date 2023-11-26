//
//  MenuViewModel.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/12/2020.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @AppStorage("BackgroundMusicIsPlaying") private var backgroundMusicIsPlaying = true
    @Published var currentQuote: (String, String) = ("", "")
    @Published var currentMusicIcon: String = ""
    
    private let menuCoordinator: MenuCoordinator
    private let musicService: MusicService
    
    private let quotes: [(String, String)] = [
        ("quote_1", "author_1"),
        ("quote_2", "author_2"),
        ("quote_3", "author_3"),
        ("quote_4", "author_4"),
        ("quote_5", "author_5"),
        ("quote_6", "author_6"),
        ("quote_7", "author_7"),
        ("quote_8", "author_8"),
        ("quote_9", "author_9"),
        ("quote_10", "author_10"),
        ("quote_11", "author_11"),
        ("quote_12", "author_12")
    ]
    
    private let musicButtonImages: [String] = ["speaker.wave.3", "speaker"]
    
    init(menuCoordinator: MenuCoordinator, musicService: MusicService) {
        debugPrint("Init MenuViewModel")
        self.menuCoordinator = menuCoordinator
        self.musicService = musicService
        currentMusicIcon = backgroundMusicIsPlaying ? musicButtonImages[0] : musicButtonImages[1]
    }
    
    func onAppear() {
//        log("Main view onAppear")
        musicService.musicIsPlaying = backgroundMusicIsPlaying
        selectRandomQuote()
    }
    
    func showGame() {
//        log("Main view showGame")
        menuCoordinator.showGame()
    }
    
    func showTutorial() {
//        log("Main view showTutorial")
        menuCoordinator.showTutorial()
    }
    
    func showStatistics() {
//        log("Main view showStatistics")
        menuCoordinator.showStatistics()
    }
    
    func toggleMusic() {
//        log("Main view toggleMusic")
        backgroundMusicIsPlaying.toggle()
        musicService.musicIsPlaying = backgroundMusicIsPlaying
        currentMusicIcon = backgroundMusicIsPlaying ? musicButtonImages[0] : musicButtonImages[1]
    }
    
    deinit {
        debugPrint("Deinit MenuViewModel")
    }
    
    // MARK: - Private functions
    
    func selectRandomQuote() {
        let randomNumber = Int.random(in: 0..<quotes.count)
        currentQuote = quotes[randomNumber]
    }
    
}
