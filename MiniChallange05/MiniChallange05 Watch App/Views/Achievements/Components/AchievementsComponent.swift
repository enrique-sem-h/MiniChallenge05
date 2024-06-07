//
//  AchievementsComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

/// Displays achievement information including an image and a progress bar.
struct AchievementsComponent: View {
    var achievementInfo : AchievementModel?
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "TimeBased")!)
            
            ProgressView(value: achievementInfo?.evaluateProgress())
                .tint(.brandYellow)
                .scaleEffect(CGSize(width: 0.5, height: 0.5))
                
        }
        .padding()
        
    }
}

