//
//  NavigationDetail.swift
//  MiniChallange05 Watch App
//
//  Created by Enrique Carvalho on 24/05/24.
//

import SwiftUI

struct AchievementDetail: View {
    
    @State var achievement: AchievementModel
    
    var body: some View {
        
        ScrollView {
            ZStack {
                LinearGradient(colors: [.achievementPurple, .black], startPoint: .top, endPoint: .bottom)
                VStack {
                    VStack {
                        Image(.timeBasedBig)
                            .resizable()
                            .frame(width: 162, height: 130, alignment: .center)
                            .padding()
                        HStack {
                            ProgressView(value: achievement.evaluateProgress())
                                .scaleEffect(CGSize(width: 1, height: 0.5))
                            Text("\(Int(achievement.evaluateProgress() * 100))%")
                                .padding(.horizontal)
                        }.padding(.horizontal)
                    }.padding(.top, 49)
                    VStack(alignment: .leading) {
                        Text(achievement.title)
                            .font(.title)
                            .fontWeight(.light)
                            .padding()
                        Text(Texts.about)
                            .font(.title3)
                            .bold()
                            .padding()
                        Text(achievement.description)
                            .fontWeight(.light)
                            .padding()
                    }.frame(width: screenWidth, alignment: .leading)
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    AchievementDetail(achievement: .init(title: "aa", description: "b", daysToAchieve: .firstWeek, imageName: ""))
}
