//
//  Message.swift
//  ChatStack
//
//  Created by Andy on 2021/5/22.
//

import Foundation

struct Message: Identifiable, Equatable {
    
    let id = UUID()
    
    let content: String
    let sender: String
    
}
