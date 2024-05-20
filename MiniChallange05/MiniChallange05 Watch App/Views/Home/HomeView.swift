//
//  HomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var user = UserModel(streakStart: .now, smokeType: .cigarette, dailyCigaretteAmount: 12, cigarettesInPack: 12, smokeCost: 10, smokingTimes: [.now], quitDay: .now)
    
    var body: some View {
        VStack{
            Text(user.lastStreak)
            Text(DateComponentsFormatter().string(from: user.lastStreak.duration) ?? "oi")
            Text(user.quitDay.description(with: .current))
            Text(user.recordDate)
            Text(user.smokeType)
            Text(user.streakStart.description)
            Text("\(user.cigarettesInPack)")
            Text(user.achievementsList.debugDescription)
            Text("\(user.dailyCigaretteAmount)")
            Text(user.smokeCost.debugDescription)
            Text(user.smokingTimes.debugDescription)
        }.onAppear{
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = "2025-11-13 09:12:22"
            if let date = format.date(from: dateString) {
//                user.lastStreak.start = date
                user.lastStreak.end = date
                print(user.lastStreak)
            }
        }
    }
}

#Preview {
    HomeView()
}
