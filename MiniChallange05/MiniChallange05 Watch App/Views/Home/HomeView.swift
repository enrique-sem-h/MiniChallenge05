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
        
        let duration = calculateDuration(from: user?.startStreak ?? .distantPast, to: Date())
        
        ScrollView {
            
            if duration >= 0 {
                VStack {
                    StreakComponents()
                        .scenePadding(.horizontal)
                }
                .padding()
                .background(Image("homeBg1")
                    .resizable()
                )
            } else if duration > 6 {
                VStack {
                    StreakComponents()
                        .scenePadding(.horizontal)
                }
                .padding()
                .background(Image("homeBg2")
                    .resizable()
                )
            } else if duration > 15 {
                VStack {
                    StreakComponents()
                        .scenePadding(.horizontal)
                }
                .padding()
                .background(Image("homeBg3")
                    .resizable()
                )
            } else if duration > 23 {
                VStack {
                    StreakComponents()
                        .scenePadding(.horizontal)
                }
                .padding()
                .background(Image("homeBg4")
                    .resizable()
                )
            } else if duration > 30 {
                VStack {
                    StreakComponents()
                        .scenePadding(.horizontal)
                }
                .padding()
                .background(Image("homeBg5")
                    .resizable()
                )
            }
            
            HealthHomeView()
                .scenePadding(.horizontal)
            
        }
        .ignoresSafeArea()
        
    }
    
    func calculateDuration(from startDate: Date, to endDate: Date) -> (Int) {
        let calendar = Calendar.current
        
        // Calcula o número de meses
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        
        let days = components.day ?? 0
        
        return (days)
        
    }
    
}

#Preview {
    HomeView()
}
