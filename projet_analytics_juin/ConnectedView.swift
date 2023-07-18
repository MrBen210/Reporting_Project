//
//  ConnectedView.swift
//  projet_analytics_juin
//
//  Created by Elie Bengou on 02/06/2023.
//

import SwiftUI

struct ConnectedView: View {
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Text("Welcome, \(authenticationVM.userDisplayName)!")
                .font(.title)
                .padding()
            
            Button(action: {
                authenticationVM.signOut()
            }) {
                Text("Log Out")
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                authenticationVM.incrementCount()
            }) {
                Text("Click")
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Text("Count: \(authenticationVM.count)")
                .padding()


        }
    }
}

