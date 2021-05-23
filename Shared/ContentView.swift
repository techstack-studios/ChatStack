//
//  ContentView.swift
//  Shared
//
//  Created by Andy on 2021/5/21.
//

import SwiftUI
import LeanCloud

struct ContentView: View {
    
    @Namespace var bottomID
    
    @EnvironmentObject var client: Client
    
    @State private var currentTyping = ""
    @State private var messageArray: [Message] = [
        Message(content: "Hi everyone", sender: "Steve"),
        Message(content: "Hi", sender: "self"),
        Message(content: "Test message", sender: "Tim")
    ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ScrollViewReader { proxy in
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
                        .id(bottomID)
                        .onChange(of: messageArray) { _ in
                            withAnimation {
                                proxy.scrollTo(bottomID)
                            }
                        }
                        
                    }
                }
                
                HStack {
                    TextField("Message", text: $currentTyping)
                    Button("Send") {
                        messageArray.append(Message(content: currentTyping.trimmingCharacters(in: .whitespacesAndNewlines), sender:"self"))
                        currentTyping = ""
                    }
                    .padding(.leading, 5)
                    .font(.body.bold())
                    .disabled(currentTyping.isEmpty)
                }
                .padding()
                .padding(.top, -8)
                
            }
            .navigationTitle("Chat")
        }
        
        // TODO: Get data from LeanCloud
        // TODO: Test on macOS, try NSColor to replace UIColor
        // TODO: Add animation
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
