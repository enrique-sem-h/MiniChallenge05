//
//  AchievementView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct AchievementsView: View {
    
    @State var achievementss : [AchievementModel]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundStyle( .background)
                    .ignoresSafeArea()
                
                ScrollView {
                    Text(Texts.achievements)
                    
                    Text(Texts.myAchievements)
                    ForEach(0..<4) {_ in
                        HStack {
                            NavigationLink {
                                AchievementDetail(achievement: .init(title: "aa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .firstDay, imageName: ""))
                            } label: {
                                AchievementsComponent(enabled: true)
                            }
                            
                            NavigationLink {
                                AchievementDetail(achievement: .init(title: "aa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", daysToAchieve: .firstWeek, imageName: ""))
                            } label: {
                                AchievementsComponent(enabled: true)
                            }
                        }
                    }
                    
                    Text(Texts.nextAchievements)
                    ForEach(0..<4) {_ in
                        HStack {
                            AchievementsComponent(enabled: false)
                            
                            AchievementsComponent(enabled: false)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AchievementsView(achievementss: [])
}
