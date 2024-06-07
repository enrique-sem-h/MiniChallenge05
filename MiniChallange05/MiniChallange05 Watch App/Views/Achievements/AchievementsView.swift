//
//  AchievementView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

/// Displays the achievements earned by the user.
struct AchievementsView: View {
    @State var releasedAchievements: [AchievementModel] = []
    @State var unreleasedAchievements: [AchievementModel] = []
    @State var achievementObjects = AchievementObjects()
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                Text(Texts.achievements)
                    .padding()
                    .bold()
                
                if !releasedAchievements.isEmpty {
                    
                    Text(Texts.myAchievements)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(releasedAchievements, id: \.id) { achievement in
                            
                            NavigationLink {
                                AchievementDetail(achievement: achievement)
                            } label: {
                                AchievementsComponent(achievementInfo: achievement)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                
                Text(Texts.nextAchievements)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(unreleasedAchievements, id: \.id) { unreleasedAchievement in
                        
                        AchievementsComponent(achievementInfo: unreleasedAchievement)
                            .foregroundColor(.brandYellow)
                            .opacity(0.5)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
            }
        }
        .background(
            LinearGradient(colors: [.achievementPurple, .black.opacity(0.2), .black], startPoint: .top, endPoint: .bottom)
        )
        .onAppear(perform: {
            achievementObjects.separeAchievementObjects(released: &releasedAchievements, unreleased: &unreleasedAchievements)
        })
    }
}

#Preview {
    AchievementsView()
}

