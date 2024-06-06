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
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundStyle( .background)
                    .ignoresSafeArea()
                
                ScrollView {
                    Text(Texts.achievements)
                        .padding()
                        .bold()
                    
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
                        ForEach(unreleasedAchievements, id: \.id) {unreleasedAchievements in
                            
                            AchievementsComponent(achievementInfo: unreleasedAchievements)
                                .opacity(0.5)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    })
                    
                }
            }
        }
        .onAppear(perform: {
            achievementObjects.separeAchievementObjects(released: &releasedAchievements, unreleased: &unreleasedAchievements)
            
        })
    }
}

#Preview {
    AchievementsView()
}
