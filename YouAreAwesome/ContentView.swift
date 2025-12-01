//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by MEEPEGAMA, JULIAN on 11/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    var body: some View {
        
        VStack {
            Spacer()
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "Gadzooks my friend! I am astonished at how utterly magnificent you are!",
                                "You Are Great!",
                                "You Are Fantastic",
                                "Fabulous? That's You!",
                                "You Make Me Smile!",
                                "When the Genius Bar Needs Help, They Call You!"]
                
                messageNumber = Int.random(in: 0...messages.count - 1)
                repeat {
                    messageNumber = Int.random(in: 0...messages.count - 1)
                } while lastMessageNumber == messageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                imageNumber = Int.random(in: 0...9)
                
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while lastImageNumber == imageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            }
        .padding()
        }
    }


#Preview {
    ContentView()
}
