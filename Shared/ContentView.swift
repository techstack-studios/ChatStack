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
    @State private var currentTyping = ""
    @State private var messageArray: [Message] = [Message(content: "Hi", sender: "Steve"), Message(content: "Hello there", sender: "Tom"), Message(content: "What's your name?", sender: "self")]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                LazyVStack {
                    ForEach(messageArray) { message in
                        
                        if message.sender == "self" {
                            SentMessageBubble(message: message.content)
                        } else {
                            ReceivedMessageBubble(message: message.content, sender: message.sender)
                        }
                        
                    }
                }
                .padding()
            }
            .navigationTitle("TechStack Studios")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    TextField("Message", text: $currentTyping)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Send") {
                        messageArray.append(Message(content: currentTyping, sender: "self"))
                    }
                    .padding(.bottom, 5)
                    .disabled(currentTyping.isEmpty)
                }
            }
            
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
