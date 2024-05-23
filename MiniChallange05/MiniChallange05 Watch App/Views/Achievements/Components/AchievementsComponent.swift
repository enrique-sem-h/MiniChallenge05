//
//  AchievementsComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct AchievementsComponent: View {
    var enabled:Bool
    
    var body: some View {
        if enabled {
            VStack {
                Ellipse()
                RoundedRectangle(cornerRadius: 7)
            }
            .padding()
            .background(.blue.opacity(0.6))
        } else {
            VStack {
                Ellipse()
                RoundedRectangle(cornerRadius: 7)
            }
            .padding()
            .background(.gray.opacity(0.6))
        }
    }
}

#Preview {
    AchievementsComponent(enabled: false)
}
