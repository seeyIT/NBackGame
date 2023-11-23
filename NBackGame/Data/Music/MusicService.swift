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
    var musicIsPlaying: Bool = true {
        didSet {
            if musicIsPlaying {
                playBackgroundMusic()
            } else {
                stopBackgroundMusic()
            }
        }
    }
    private let fadeDuration: TimeInterval = TimeInterval(1)
    
    init() {
        preparePlayer()
    }
    
    private func preparePlayer() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: .duckOthers)
        } catch {
            print("Can't set proper category, error: \(error)")
        }
    }
    
    func playBackgroundMusic() {
        if let audioURL = Bundle.main.url(forResource: "background", withExtension: "m4a") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer?.volume = 0.5
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.play()
            } catch {
                print("Couldn't play audio, error: \(error)")
            }
        } else {
            print("No audio file found")
        }
    }
    
    func stopBackgroundMusic() {
        if let player = self.audioPlayer {
            player.stop()
        } else {
            print("Can't stop background music because audio player is nil")
        }
    }
    
    func playLetter(_ letter: String) {
        if let audioURL = Bundle.main.url(forResource: letter, withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
            } catch {
                print("Can't play audio, error: \(error)")
            }
        } else {
            print("No audio file found")
        }
    }
}
