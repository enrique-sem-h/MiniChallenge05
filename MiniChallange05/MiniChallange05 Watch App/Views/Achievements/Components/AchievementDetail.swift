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
        
                VStack {
                    VStack {
                        Image(.timeBasedBig)
                            .resizable()
                            .frame(width: 162, height: 130, alignment: .center)
                            .padding()
                        
                        HStack {
                            ProgressView(value: achievement.progress, total: 100)
                                .scaleEffect(CGSize(width: 1, height: 0.5))
                            Text("\(Int(achievement.progress))%")
                                .padding(.horizontal)
                                .font(.system(.caption, weight: .semibold))
                                .foregroundStyle(.brandYellow)
                        }.padding(.horizontal)
                        
                    }.padding(.top, 49)
                    
                    VStack(alignment: .leading) {
                        Text(achievement.title)
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundStyle(.brandYellow)
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
            }.background(
                LinearGradient(colors: [.achievementPurple,
                    .black], startPoint: .top, endPoint: .bottom)
            )
        }.ignoresSafeArea()
            .onAppear {
                achievement.evaluateProgress()
            }
    }
}

#Preview {
    AchievementDetail(achievement: .init(title: "aa", description: "b", daysToAchieve: .firstWeek, imageName: ""))
}
