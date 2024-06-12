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
        VStack (spacing: 0){
            Image(uiImage: UIImage(named: "TimeBased")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth / 2.4, height: screenHeight / 2)
            
            ProgressView(value: achievementInfo?.evaluateProgress())
                .tint(.brandYellow)
                .scaleEffect(CGSize(width: 0.7, height: 0.5))
                .padding(-10)
                
        }
        
    }
}

