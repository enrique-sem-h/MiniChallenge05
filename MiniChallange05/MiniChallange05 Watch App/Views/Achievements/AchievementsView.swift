//
//  AchievementView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct AchievementsView: View {
    
    @State var releasedAchievements : [AchievementModel] = []
    @State var unreleasedAchievements : [AchievementModel] = []
    @State var achievementObjects = AchievementObjects()
    
    var body: some View {
            
            ZStack {
                
                ScrollView {
                    Text(Texts.achievements)
                    
                    //Achievements reached
                    if (!releasedAchievements.isEmpty){
                        
                        Text(Texts.myAchievements)
                        
                        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                            ForEach(releasedAchievements, id: \.id) { achiement in
                                
                                NavigationLink {
                                    AchievementDetail(achievement: achiement)
                                } label: {
                                    AchievementsComponent(achievementInfo: achiement)
                                }
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                        })
                    }
                    
                    
                    
                    //Achievements not released
                    Text(Texts.nextAchievements)
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                        ForEach(unreleasedAchievements, id: \.id) {_ in
                            
                            AchievementsComponent(achievementInfo: nil)
                                .opacity(0.5)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    })
                    
                }
            }
            .background(
                LinearGradient(colors: [.achievementPurple,
                    .black.opacity(0.2),
                    .black], startPoint: .top, endPoint: .bottom)
            )
            .onAppear(perform: {
                achievementObjects.separeAchievementObjects(released: &releasedAchievements, unreleased: &unreleasedAchievements)
            })
    
    }
}

#Preview {
    AchievementsView()
}
