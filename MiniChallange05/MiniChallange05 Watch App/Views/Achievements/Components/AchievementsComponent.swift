//
//  AchievementsComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

// Esta estrutura define um componente de conquistas, que exibe a imagem e o progresso de uma conquista.
struct AchievementsComponent: View {
    var achievementInfo : AchievementModel?
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "TimeBased")!)
                .frame(width: screenWidth / 4, height: screenHeight / 4)
            
            ProgressView(value: achievementInfo?.evaluateProgress())
                .tint(.brandYellow)
                .scaleEffect(CGSize(width: 0.7, height: 0.5))
                
        }
        .padding()
        
    }
}
