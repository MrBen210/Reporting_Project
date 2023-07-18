//
//  projet_analytics_juinApp.swift
//  projet_analytics_juin
//
//  Created by Elie Bengou on 02/06/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}

@main
struct YourApp: App {
    // Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authenticationVM = AuthenticationViewModel() // Create an instance of AuthenticationViewModel
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authenticationVM.isLoggedIn {
                    ConnectedView()
                } else {
                    ContentView()
                }
            }
            .environmentObject(authenticationVM) // Make the authenticationVM available in the environment
        }
    }
}
