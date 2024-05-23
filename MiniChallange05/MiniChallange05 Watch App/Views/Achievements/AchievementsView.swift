//
//  AchievementView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct AchievementsView: View {
    var body: some View {
        ScrollView {
            Text("Conquistas")
            
            Text("Minhas Conquistas")
            ForEach(0..<4) {_ in
                HStack {
                    AchievementsComponent(enabled: true)
                    
                    AchievementsComponent(enabled: true)
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

#Preview {
    AchievementsView()
}
