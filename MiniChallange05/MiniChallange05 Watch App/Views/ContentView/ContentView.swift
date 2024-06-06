//
//  ContentView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

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
