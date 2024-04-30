//
//  ContentView.swift
//  CardViewGroupBox
//
//  Created by Jonathan Ma on 2024-04-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.pink.gradient.opacity(0.8))
                .ignoresSafeArea()
            VStack(spacing: 40) {
                GroupBox("My content") {
                    Text("This is a groupbox")
                }
                .frame(width: 240)
                .groupBoxStyle(.music)
                
                GroupBox {
                    GroupBox {
                        MusicPlayerView()
                    }
                } label: {
                    Label("Now playing", systemImage: "music.note")
                }
                .groupBoxStyle(.music)
            }
            .padding()
        }

    }
}

#Preview {
    ContentView()
}

struct MusicGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .bold()
                .foregroundStyle(.pink)
            configuration.content
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))

    }
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    static var music: MusicGroupBoxStyle { .init() }
}


struct MusicPlayerView: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.secondary)
                
                VStack(alignment: .leading, spacing: 2){
                    Text("Cool Song Title")
                        .font(.headline.bold())
                    
                    Text("Artist Name")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(.bottom, 8)
            
            ProgressView(value: 0.4, total: 1)
                .tint(.secondary)
                .padding(.bottom, 20)
            
            HStack(spacing: 20){
                Image(systemName: "backward.fill")
                Image(systemName: "pause.fill")
                Image(systemName: "play.fill")
            }
            .foregroundStyle(.secondary)
            .font(.title)
        }
        
    }
}
