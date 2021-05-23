//
//  ContentView.swift
//  Shared
//
//  Created by Andy on 2021/5/21.
//

import SwiftUI
import LeanCloud

struct ContentView: View {
    
    @EnvironmentObject var client: Client
    var messageArray: [Message] = [Message(message: "Hi", sender: "Steve"), Message(message: "Hello there", sender: "Tom")]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(messageArray) { message in
                        ReceivedMessage(message: message.message, sender: message.sender)
                    }
                }
                .padding()
            }
            .navigationTitle("TechStack Studios")
        }
        // TODO: Add input field
        // TODO: Get data from LeanCloud
        // TODO: Test on macOS, try NSColor to replace UIColor
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
