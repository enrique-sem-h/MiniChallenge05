//
//  MiniChallange05App.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

@main
struct MiniChallange05_Watch_AppApp: App {
            
    private let localNotification = LocalNotifications()
    
    var body: some Scene {
        WindowGroup {
            Onboard()
                .environment(PageManager())
        }
    }
}
