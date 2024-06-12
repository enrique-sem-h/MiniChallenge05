//
//  CigaretteCountView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI
import WatchKit

/// Displays the view for selecting the number of cigarettes smoked per day.
struct CigaretteCountView: View {
    @Environment(PageManager.self) var pageManager
    @State var tempVar: Int = 1
    @Binding var defVar: Int
    var userPreferences: UserPreferences
    let textConfig: TextConfig
    
    var body: some View {
        
        ScrollView {
            
            Text(Texts.cigaretteCountQuestion)
                .font(.title2)
                .minimumScaleFactor(textConfig.scaleFactor)
                .frame(maxWidth: .infinity, maxHeight: textConfig.maxHeight, alignment: .leading)
            
            OnboardingPicker(selectedNumber: $tempVar)
                .frame(height: textConfig.frameHeight)
            
            HStack {
                Text("\(tempVar)")
                    .foregroundStyle(.brandYellow)
                Text(Texts.returnCigarettes(number: tempVar))
            }.italic()
            
            GenericBackAndNextButton(fowardView: .cigarettesPerPack, backwardsView: .smokingType , tempVar: $tempVar, defVar: $defVar)
                .padding(.top)
        }
        .padding(.horizontal)
        .background(
            LinearGradient(colors: [.achievementPurple,
                .black.opacity(0.2),
                .black], startPoint: .top, endPoint: .bottom)
        )
        .onDisappear {
            userPreferences.cigarsPerDay = defVar
        }
        
    }
}

#Preview {
    let pageManager = PageManager()
    return CigaretteCountView(tempVar: 1, defVar: .constant(200), userPreferences: UserPreferences(), textConfig: TextConfig())
        .environment(pageManager)
}

