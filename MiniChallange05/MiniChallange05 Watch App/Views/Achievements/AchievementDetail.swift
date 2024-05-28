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
        VStack {
            ScrollView {
                VStack {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 162, height: 130, alignment: .center)
                        .padding()
                    HStack {
                        ProgressView(value: achievement.progress, total: 100)
                            .scaleEffect(CGSize(width: 1, height: 0.5))
                        Text("\(Int(achievement.progress))%")
                            .padding(.horizontal)
                    }.padding(.horizontal)
                }
                VStack(alignment: .leading) {
                    Text(achievement.title)
                        .font(.title)
                        .fontWeight(.light)
                        .padding(.bottom, 20)
                    Text("About")
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 8)
                    Text(achievement.description)
                        .fontWeight(.light)
                }.frame(width: screenWidth, alignment: .leading)
            }
        }
        .background{
            LinearGradient(colors: [.black, .achievementsGray], startPoint: .top, endPoint: .bottom)
                .frame(width: screenWidth, height: screenHeight)
        }
    }
}

#Preview {
    AchievementDetail(achievement: .init(progress: 10, title: "aa", description: "b"))
}
