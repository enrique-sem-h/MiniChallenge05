//
//  AchievementsComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct AchievementsComponent: View {
    
    let tax = 0.5
    
    var body: some View {
        
        VStack {
            Image(uiImage: UIImage(named: "TimeBased")!)
            
            ProgressView(value: tax)
                .scaleEffect(CGSize(width: 0.5, height: 0.5))
        }
        .padding()
        
    }
}
    
    #Preview {
        AchievementsComponent()
    }
