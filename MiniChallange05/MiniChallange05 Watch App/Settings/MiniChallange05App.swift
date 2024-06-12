//
//  MiniChallange05App.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

/// The main entry point of the MiniChallange05 Watch App.
@main
struct MiniChallange05_Watch_AppApp: App {
    
    /// Indicates whether the onboarding process has been completed.
    var isOnboarding: Bool {
        get {
            UserDefaults.standard.bool(forKey: Texts.Keys.isOnboarding.rawValue)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if !isOnboarding {
                Onboard(isOnboarding: isOnboarding)
                    .environment(PageManager())
            } else {
                ContentView()
            }
        }
    }
}

