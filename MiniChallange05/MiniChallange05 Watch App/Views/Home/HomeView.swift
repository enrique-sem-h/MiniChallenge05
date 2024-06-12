//
//  HomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

/// The main view displaying streak and health-related information.
struct HomeView: View {
    @State var user = DataManager.shared.userModel
    @State var background: Image = Image("homeBg1")
    
    var body: some View {
        ScrollView {
            ZStack {
                background
                    .resizable()
                    .frame(maxWidth: .infinity)
                
                LinearGradient(colors: [.black.opacity(0.5), .black.opacity(0.1) , .black], startPoint: .top, endPoint: .bottom)
                
                StreakComponents()
                    .padding(.horizontal)
                
            }
            
            HealthHomeView()
                .padding(.bottom, 30)
                .padding(.horizontal)
            
        }
        .onAppear(perform: {
            changeBackground()
        })
        
        .ignoresSafeArea()
        .background(LinearGradient(colors: [.black, .black.opacity(0.2) , .achievementPurple.opacity(0.8)], startPoint: .top, endPoint: .bottom))
        
    }
    
    /// Calculates the duration between two dates.
    func calculateDuration(from startDate: Date, to endDate: Date) -> Int {
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        
        let days = components.day ?? 0
        
        return days
    }
    
    /// Changes the background image based on the duration of the streak.
    func changeBackground() {
        let duration = calculateDuration(from: user?.startStreak ?? .distantPast, to: Date())
        
        switch duration {
        case 0...6:
            background = Image("homeBg1")
        case 7...15:
            background = Image("homeBg2")
        case 16...23:
            background = Image("homeBg3")
        case 24...30:
            background = Image("homeBg4")
        case 30...:
            background = Image("homeBg5")
        default:
            background = Image("")
        }
    }
    
}

#Preview {
    HomeView()
}

