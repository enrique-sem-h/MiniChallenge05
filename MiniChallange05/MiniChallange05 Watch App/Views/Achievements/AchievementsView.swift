//
//  AchievementView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct AchievementsView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                Text("Conquistas")
                
                Text("Minhas Conquistas")
                ForEach(0..<4) {_ in
                    HStack {
                        NavigationLink {
                            AchievementDetail(achievement: .init(progress: 10, title: "aa", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
                        } label: {
                            AchievementsComponent(enabled: true)
                        }
                        NavigationLink {
//                            AchievementDetail()
                        } label: {
                            AchievementsComponent(enabled: true)
                        }
                    }
                }
                
                Text("Próximas Conquistas")
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

#Preview {
    AchievementsView()
}
