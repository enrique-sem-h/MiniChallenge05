//
//  HomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var user = DataManager.shared.userModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle( .background)
                .ignoresSafeArea()
            
            ScrollView {
                
                StreakComponents()
                
                HealthHomeView()
                
                ConquestHomeView()
                
            }
            .scenePadding(.horizontal)
        }
    }
}

#Preview {
    HomeView()
}
