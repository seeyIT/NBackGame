//
//  MusicService.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 05/10/2021.
//

import Foundation
import AVFoundation

class MusicService {
    
    private var audioPlayer: AVAudioPlayer?
    private let fadeDuration: TimeInterval = TimeInterval(1)
    
    init() {
        prepareBackgroundPlayer()
    }
    
    private func prepareBackgroundPlayer() {
        if let audioURL = Bundle.main.url(forResource: "background", withExtension: "m4a") {
            do {
                try self.audioPlayer = AVAudioPlayer(contentsOf: audioURL)
                self.audioPlayer?.numberOfLoops = -1
            } catch {
                print("Couldn't play audio, error: \(error)")
            }
        } else {
            print("No audio file found")
        }
    }
    
    func playBackgroundMusic() {
        if let player = self.audioPlayer {
            player.play()
            player.setVolume(1, fadeDuration: fadeDuration)
        } else {
            print("Can't play background music because audio player is nil")
        }
    }
    
    func stopBackgroundMusic() {
        if let player = self.audioPlayer {
            player.setVolume(0, fadeDuration: fadeDuration)
        } else {
            print("Can't stop background music because audio player is nil")
        }
    }
}
