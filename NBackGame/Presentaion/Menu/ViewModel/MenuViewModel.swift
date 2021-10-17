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
    
    private let menuCoordinator: MenuViewCoordinator
    private let musicService: MusicService
    
    private let quotes: [(String, String)] = [("We now accept the fact that learning is a lifelong process of keeping abreast of change. And the most pressing task is to teach people how to learn.", "Peter Drucker"),
                                              ("Live as if you were to die tomorrow. Learn as if you were to live forever.", "Mahatma Gandhil"),
                                              ("I am always ready to learn although I do not always like being taught.", "Winston Churchill"),
                                              ("Wisdom is not a product of schooling but of the lifelong attempt to acquire it.", "Albert Einstein"),
                                              ("One learns from books and example only that certain things can be done. Actual learning requires that you do those things.", "Frank Herbert"),
                                              ("Tell me and I forget, teach me and I may remember, involve me and I learn.", "Benjamin Franklin"),
                                              ("Develop a passion for learning. If you do, you will never cease to grow.", "Anthony J. D’Angelo"),
                                              ("You don’t understand anything until you learn it more than one way", "Marvin Minsky"),
                                              ("He who laughs most, learns best.", "John Cleese"),
                                              ("Anyone who stops learning is old, whether at twenty or eighty. Anyone who keeps learning stays young. The greatest thing in life is to keep your mind young.", "Henry Ford"),
                                              ("Study hard what interests you the most in the most undisciplined, irreverent and original manner possible.", "Richard Feynman"),
                                              ("The beautiful thing about learning is nobody can take it away from you.", "B.B. King")
    ]
    
    private let musicButtonImages: [String] = ["speaker.wave.3", "speaker"]
    
    init(menuCoordinator: MenuViewCoordinator, musicService: MusicService) {
        debugPrint("Init MenuViewModel")
        self.menuCoordinator = menuCoordinator
        self.musicService = musicService
        currentMusicIcon = backgroundMusicIsPlaying ? musicButtonImages[0] : musicButtonImages[1]
    }
    
    func onAppear() {
        musicService.musicIsPlaying = backgroundMusicIsPlaying
        selectRandomQuote()
    }
    
    func showGame() {
        menuCoordinator.showGame()
    }
    
    func showTutorial() {
        menuCoordinator.showTutorial()
    }
    
    func showStatistics() {
        menuCoordinator.showStatistics()
    }
    
    func toggleMusic() {
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
