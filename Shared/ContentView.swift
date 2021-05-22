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
    
    var body: some View {
        Text("Conversations")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
