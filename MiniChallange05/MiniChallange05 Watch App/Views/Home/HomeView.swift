//
//  HomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var user = UserModel(startStreak: .now, cigarsType: .cigarette, smokeCost: 1, hourSmoke: [.now], quitDay: .now)
    
    var body: some View {
        VStack{
            Text(user.streakPast)
            Text(DateComponentsFormatter().string(from: user.streakPast.duration) ?? "oi")
            Text(user.quitDay.description(with: .current))
            Text(user.recordDate)
            Text(user.cigarsType)
            Text(user.startStreak.description)
            Text("\(user.cigarettesInPack)")
            Text(user.achievementsList.debugDescription)
            Text("\(user.cigarsPerDay)")
            Text(user.smokeCost.debugDescription)
            Text(user.hourSmoke.debugDescription)
        }.onAppear{
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = "2025-11-13 09:12:22"
            if let date = format.date(from: dateString) {
                user.streakPast.end = date
                print(user.streakPast)
            }
        }
    }
}

#Preview {
    HomeView()
}
