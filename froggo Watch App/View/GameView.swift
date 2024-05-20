//
//  GameView.swift
//  froggo Watch App
//
//  Created by Reza Athallah Rasendriya on 20/05/24.
//

import SwiftUI

struct GameView: View {
    @State var isPlaying = false
    
    @State var mode: Int
    @State var modeSfSymbol: String
    
    @State var gameTimer: Timer?
    @State var playingTime = 0
    @State var score = 0
    @State var tutorialTick = 0
    @State var goodTolerance = 0.2
    @State var perfectTolerance = 0.1
    
    var body: some View {
        VStack {
            if !isPlaying {
                VStack {
                    Text("\(playingTime)")
                    Image(systemName: modeSfSymbol)
                        .resizable()
                        .foregroundStyle(.tint)
                        .frame(width: 75, height: 75)
                    Text("\(score)")
                }
            } else {
                
            }
            
        }
        .onTapGesture {
            handleTap()
        }
        .onAppear(perform: {
            play()
        })
        .navigationBarBackButtonHidden(true)
        
    }

    func handleTap() {
        if isPlaying {
            let tapTime = Date()
            let timeDiff = tapTime.timeIntervalSince(Metronome.metronomeTickTime)
            
            if abs(timeDiff) <= goodTolerance {
                print("tap in good time")
                score += 50
            } else if abs(timeDiff) <= perfectTolerance {
                print("tap perfect time")
                score += 100
            } else {
                print("stop playing")
                isPlaying = false
            }
        }
        
    }
    
    func playTime() {
        
    }
    
    func play() {
        if tutorialTick > 0 {
            tutorialTick -= 1
        } else {
            
        }
        
        
    }
}

//#Preview {
////    GameView()
//}
