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
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Text(message)
                    .padding(8)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            .padding()
            Spacer()
        }
    }
    
}

struct ReceivedMessage_Previews: PreviewProvider {
    static var previews: some View {
        ReceivedMessage(message: "Hello. My name is Steve.", sender: "Steve")
            .previewLayout(.sizeThatFits)
    }
}
