//
//  HomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var user = DataManager.shared.userModel
    
    @State var background: Image = Image("homeBg2")
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                StreakComponents()
                    .scenePadding(.horizontal)
            }
            .background(self.background
                .resizable()
            )
            
            HealthHomeView()
                .padding(.horizontal)
            
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            changeBackground()
        })
        
    }
    
    func calculateDuration(from startDate: Date, to endDate: Date) -> (Int) {
        let calendar = Calendar.current
        
        // Calcula o número de meses
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        
        let days = components.day ?? 0
        
        return (days)
    }
    
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
