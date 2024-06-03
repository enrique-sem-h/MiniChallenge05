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
            
            Image("homeBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1.0),Color.black.opacity(0.44),Color.black.opacity(0.3)]), startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
            
            ScrollView {
                
                StreakComponents()
                
                HealthHomeView()
                
                //                ConquestHomeView()
                
            }
            .scenePadding(.horizontal)
            
            
            
            
            
            
            
        }
    }
}

#Preview {
    HomeView()
}
