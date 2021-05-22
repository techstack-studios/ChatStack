//
//  ReceivedMessage.swift
//  ChatStack
//
//  Created by Andy on 2021/5/22.
//

import SwiftUI

struct ReceivedMessage: View {
    
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
                    .padding(.horizontal, 6)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }
            Spacer()
        }
    }
    
}

struct ReceivedMessage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReceivedMessage(message: "Hello. My name is Steve.", sender: "Steve")
            ReceivedMessage(message: "I", sender: "Steve")
        }
        .previewLayout(.sizeThatFits)
    }
}
