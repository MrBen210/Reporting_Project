//
//  AuthenticationViewModel.swift
//  projet_analytics_juin
//
//  Created by Elie Bengou on 02/06/2023.
//

import SwiftUI
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    @Published var userDisplayName = ""
    @Published var count = UserDefaults.standard.integer(forKey: "Count")

    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                // Handle login error
                self.errorMessage = error.localizedDescription
            } else {
                // Successful login
                self.email = ""
                self.password = ""
                self.errorMessage = ""
                self.isLoggedIn = true
                self.userDisplayName = authResult?.user.displayName ?? ""
                
                self.resetCount()
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                // Handle sign-up error
                self.errorMessage = error.localizedDescription
            } else {
                // Successful sign-up
                self.email = ""
                self.password = ""
                self.errorMessage = ""
                self.isLoggedIn = true
                self.userDisplayName = authResult?.user.displayName ?? ""
                
                self.resetCount()
            }
        }
    }


    func resetCount() {
        UserDefaults.standard.set(0, forKey: "Count")
        count = 0
    }

    func incrementCount() {
        if count >= 9 {
            fatalError("Crash to test Crashlytics")
        }
        
        count += 1
        UserDefaults.standard.set(count, forKey: "Count")
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.userDisplayName = ""
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
 

}
