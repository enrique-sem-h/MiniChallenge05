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
            ScrollView{
                VStack(alignment: .leading){
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
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
                }.frame(width: screenWidth, height: screenHeight, alignment: .leading)
            }
        }.frame(width: screenWidth, height: screenHeight)
        .background{
            LinearGradient(colors: [.black, .achievementsGray], startPoint: .top, endPoint: .bottom)
        }
    }
}

#Preview {
    AchievementDetail(achievement: .init(progress: 10, title: "aa", description: "b"))
}
