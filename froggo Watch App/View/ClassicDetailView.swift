//
//  ClassicDetailView.swift
//  froggo Watch App
//
//  Created by Reza Athallah Rasendriya on 17/05/24.
//

import SwiftUI

struct ClassicDetailView: View {
    @State var metronomeTimer: Timer?
    @State var mode: Int
    @State var modeSfSymbol: String
    @State var bpm = 100.0
    
    var body: some View {
        VStack {
            Spacer()
            
            NavigationLink(destination: GameView(mode: mode, modeSfSymbol: modeSfSymbol), label: {
                Image(systemName: modeSfSymbol)
                    .resizable()
                    .foregroundStyle(.tint)
                    .frame(width: 75, height: 75)
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            HStack {
                Button(action: decrementBpm, label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Text("\(Int(bpm))")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                Spacer()
                
                Button(action: incrementBpm, label: {
                    Image(systemName: "chevron.right")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
        .onAppear(perform: {
            Metronome.playMetronome()
        })
        .onDisappear(perform: {
            
        })
    }
    
    func decrementBpm() {
        if bpm > 50 {
            bpm -= 10.0
            let timeInterval: TimeInterval = 60.0 / bpm
            Metronome.updateInterval(setBPM: timeInterval)
        }
    }
    
    func incrementBpm() {
        if bpm < 200 {
            bpm += 10.0
            let timeInterval: TimeInterval = 60.0 / bpm
            Metronome.updateInterval(setBPM: timeInterval)
        }
    }
}

//#Preview {
//    ClassicDetailView()
//}
