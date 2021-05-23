//
//  LoginView.swift
//  ChatStack
//
//  Created by Andy on 2021/5/22.
//

import SwiftUI
import LeanCloud

struct LoginView: View {
    
    @EnvironmentObject var client: Client
    @State private var username: String = ""
    @State private var password: String = ""
    
//    TODO: Add validating function
//    func validate(username: String, password: String) {
//        <#function body#>
//    }
    
    func handleLogin(username: String, password: String) {
        LCUser.logIn(username: username, password: password) { (result) in
            switch result {
            case .success(object: let user):
                do {
                    client.user = try IMClient(user: user)
                    client.user.open { (result) in
                        switch result {
                        case .success:
                            client.loggedIn = true
                        case .failure(error: let error):
                            print(error)
                        }
                    }
                } catch {
                    print(error)
                }
            case .failure(error: let error):
                print(error.reason ?? error.code)
            }
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Label("Login", systemImage: "person.crop.circle")
                .labelStyle(IconOnlyLabelStyle())
                .font(.system(size: 60))
                .foregroundColor(.accentColor)
            Text("Login to ChatStack")
                .font(.largeTitle)
                .bold()
            TextField("User ID", text: $username)
                .autocapitalization(.none) // FIXME: macOS uncompatible
                .disableAutocorrection(true)
            SecureField("Password", text: $password) {
                handleLogin(username: username, password: password)
            }
            // TODO: Add login button which disables when validation is false
            Spacer()
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
