//
//  HomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var user = DataManager.shared.userModel
    
    var body: some View {
        VStack{
//            Text(user?.streakPast.debugDescription ?? "notfound")
//            Text(DateComponentsFormatter().string(from: (user?.streakPast.duration)!)!)
//            Text((user?.quitDay.description(with: .current))!)
//            Text(user?.recordDate ?? "error")
//            Text(user?.cigarsType ?? "error")
//            Text(user?.startStreak.description ?? "error")
//            Text("\(user?.cigarettesInPack ?? 1)")
//            Text(user.achievementsList.debugDescription)
//            Text("\(user.cigarsPerDay)")
//            Text(user.smokeCost.debugDescription)
//            Text(user.hourSmoke.debugDescription)
        }.onAppear{
            DataManager.shared.fetchUser()
        }
    }
}

#Preview {
    HomeView()
}
