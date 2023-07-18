//
//  ContentView.swift
//  projet_analytics_juin
//
//  Created by Elie Bengou on 02/06/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            TextField("Email", text: $authenticationVM.email )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
            SecureField("Password", text: $authenticationVM.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                authenticationVM.signIn()
            }) {
                Text("Sign In")
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                authenticationVM.signUp()
            }) {
                Text("Create Account")
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            
            Text(authenticationVM.errorMessage)
                .foregroundColor(.red)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
