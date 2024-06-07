//
//  NavigationDetail.swift
//  MiniChallange05 Watch App
//
//  Created by Enrique Carvalho on 24/05/24.
//

import SwiftUI

// Esta estrutura define a visualização detalhada de um achievement.
struct AchievementDetail: View {
    @State var achievement: AchievementModel
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    VStack {
                        Image(.timeBasedBig)
                            .resizable()
                            .frame(width: screenWidth - 20, height: screenHeight / 1.8, alignment: .center)
                            .padding(.bottom, 3)
                        HStack {
                            ProgressView(value: achievement.evaluateProgress())
                                .scaleEffect(CGSize(width: 1, height: 0.5))
                                .tint(.brandYellow)
                            Text("\(Int(achievement.evaluateProgress() * 100))%")
                                .foregroundColor(.brandYellow)
                                
                        }.padding(.horizontal)
                            .frame(width: screenWidth - 10)
                    }.padding(.top, 49)
                    VStack(alignment: .leading) {
                        Text(achievement.title)
                            .minimumScaleFactor(0.5)
                            .font(.title)
                            .fontWeight(.light)
                            .padding()
                            .foregroundColor(.brandYellow)
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
            .onAppear(perform: {
                print(achievement.evaluateProgress())
            })
    }
}

#Preview {
    AchievementDetail(achievement: .init(title: "aa", description: "b", daysToAchieve: .firstWeek, imageName: ""))
}
