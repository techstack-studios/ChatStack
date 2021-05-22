//
//  ChatStackApp.swift
//  Shared
//
//  Created by Andy on 2021/5/21.
//

import SwiftUI
import LeanCloud

@main
struct ChatStackApp: App {
    
    @StateObject var client = Client()
    
    init() {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist"), let keys = NSDictionary(contentsOfFile: path) as? [String: String] {
            do {
                try LCApplication.default.set(
                    id: keys["AppID"]!,
                    key: keys["AppKey"]!,
                    serverURL: keys["ServerURL"]!)
            } catch {
                print(error)
            }
        } else {
            print("Keys.plist not found")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if client.loggedIn {
                ContentView()
                    .environmentObject(client)
            } else {
                LoginView()
                    .environmentObject(client)
            }
        }
    }
    
}
