//
//  MiniChallange05App.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

@main
struct MiniChallange05_Watch_AppApp: App {
<<<<<<< HEAD
            
    private let localNotification = LocalNotifications()
=======
    var isOnboarding: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isOnboarding")
        }
    }
>>>>>>> Developer
    
    var body: some Scene {
        WindowGroup {
            if !isOnboarding{
                Onboard(isOnboarding: isOnboarding)
                    .environment(PageManager())
            } else {
                ContentView()
            }
        }
    }
}
