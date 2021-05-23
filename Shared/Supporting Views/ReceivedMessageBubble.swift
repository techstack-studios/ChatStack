//
//  ReceivedMessageBubble.swift
//  ChatStack
//
//  Created by Andy on 2021/5/22.
//

import SwiftUI

struct ReceivedMessageBubble: View {
    
    var message: String
    var sender: String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 2) {
                Text(sender)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(message)
                    .padding(8)
                    .padding(.horizontal, 5)
                    .background(Color(.systemGray5)) // FIXME: macOS incompatible
                    .cornerRadius(10)
            }
            Spacer()
        }
    }
    
}

struct ReceivedMessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReceivedMessageBubble(message: "Hello. My name is Steve.", sender: "Steve")
            ReceivedMessageBubble(message: "I", sender: "Steve")
        }
        .previewLayout(.sizeThatFits)
    }
}
