//
//  SentMessageBubble.swift
//  ChatStack
//
//  Created by Andy on 2021/5/22.
//

import SwiftUI

struct SentMessageBubble: View {
    
    var message: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(message)
                .padding(8)
                .padding(.horizontal, 6)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
    }
    
}

struct SentMessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        SentMessageBubble(message: "Hi. What's your name?")
            .previewLayout(.sizeThatFits)
    }
}
