//
//  HomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct HomeView: View {
    

    var body: some View {
        ScrollView {
            VStack {
                StreakComponents()
                
                HealthHomeView()
                
                ConquestHomeView()
            }
        }
    }
}

#Preview {
    HomeView()
}
