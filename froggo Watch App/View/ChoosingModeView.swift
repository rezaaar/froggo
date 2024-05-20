//
//  ChoosingModeView.swift
//  froggo Watch App
//
//  Created by Reza Athallah Rasendriya on 17/05/24.
//

import SwiftUI

struct ChoosingModeView: View {
    @State var mode = 0
    @State var modeSfSymbol = "square.fill"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    Button(action: prevMode, label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    NavigationLink(destination: ClassicDetailView(mode: mode, modeSfSymbol: modeSfSymbol), label: {
                        Image(systemName: modeSfSymbol)
                            .resizable()
                            .foregroundStyle(.tint)
                            .frame(width: 75, height: 75)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button(action: nextMode, label: {
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                
                
//                NavigationLink(destination: ClassicDetailView(), label: {
//                    Text("Play")
//                })
            }
            .padding()
        }
        .onAppear(perform: {
            AudioPlayer.preloadAudioPlayer(fileName: "frogsfx")
        })
    }
    
    func nextMode() {
        if mode == 0 {
            mode = 1
            modeSfSymbol = "circle.fill"
        } else {
            mode = 0
            modeSfSymbol = "square.fill"
        }
    }
    
    func prevMode() {
        if mode == 0 {
            mode = 1
            modeSfSymbol = "circle.fill"
        } else {
            mode = 0
            modeSfSymbol = "square.fill"
        }
    }
}

#Preview {
    ChoosingModeView()
}
