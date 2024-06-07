//
//  MiniChallange05App.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

// Arquivo definir o App e a main, e validar se o Onboarding será mostrado ou n 
@main
struct MiniChallange05_Watch_AppApp: App {
    
    var isOnboarding: Bool {
        get {
            UserDefaults.standard.bool(forKey: Texts.Keys.isOnboarding.rawValue)
        }
    }
    
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
