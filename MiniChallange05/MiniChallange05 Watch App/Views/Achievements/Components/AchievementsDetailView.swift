//
//  AchievementsDetailView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct AchievementsDetailView: View {
    var body: some View {
        ScrollView {
            VStack {
                Ellipse()
                RoundedRectangle(cornerRadius: 7)
            }
            .frame(width: 150, height: 130)
            .padding()
            .background(.blue.opacity(0.6))
            
            Text("Nome da Conquista")
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                .minimumScaleFactor(0.5)
        }
    }
}

#Preview {
    AchievementsDetailView()
}
