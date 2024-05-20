//
//  ContentView.swift
//  froggo Watch App
//
//  Created by Reza Athallah Rasendriya on 16/05/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var player: AVAudioPlayer?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: {
            AudioPlayer.preloadAudioPlayer(fileName: "frogsfx")
        })
    }
}

#Preview {
    ContentView()
}
