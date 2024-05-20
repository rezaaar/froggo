//
//  Metronome.swift
//  froggo Watch App
//
//  Created by Reza Athallah Rasendriya on 20/05/24.
//

import Foundation

class Metronome {
    static var bpm = 100.0
    static var metronomeTimer: Timer?
    static var timeInterval: TimeInterval = 60.0 / bpm
    static var metronomeTickTime: Date = Date()
    
    static func playMetronome() {
        metronomeTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
            action()
        }
    }
    
    static func stopMetronome() {
        metronomeTimer?.invalidate()
    }
    
    static func updateInterval(setBPM: TimeInterval) {
        stopMetronome()
        timeInterval = setBPM
        playMetronome()
    }
    
    static func action() {
        metronomeTickTime = Date()
        AudioPlayer.playMusic()
    }
    
}
