//
//  ContentView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

/// Main content view displaying a tab view with home, user progress, and achievements.
struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                UserProgressView()
                AchievementsView()
            }
        }
    }
}

#Preview {
    ContentView()
}

