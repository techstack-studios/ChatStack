//
//  Message.swift
//  ChatStack
//
//  Created by Andy on 2021/5/22.
//

import Foundation

struct Message: Identifiable {
    
    let id = UUID()
    
    let content: String
    let sender: String
    
}
