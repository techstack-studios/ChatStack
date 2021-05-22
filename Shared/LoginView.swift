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
    
//    func validate(username: String, password: String) -> <#return type#> {
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
                            break
                        case .failure(error: let error):
                            print(error)
                        }
                    }
                } catch {
                    print(error)
                }
            case .failure(error: let error):
                print(error)
            }
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Label("Login", systemImage: "person.crop.circle")
                .labelStyle(IconOnlyLabelStyle())
                .font(.system(size: 60))
                .foregroundColor(Color(UIColor.systemGray))
            Text("Login")
                .font(.largeTitle)
                .bold()
            TextField("User ID", text: $username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            SecureField("Password", text: $password) {
                handleLogin(username: username, password: password)
            }
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
