//
//  CigarettesPerPackView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct CigarettesPerPackView: View {
    @Environment(PageManager.self) var pageManager
    @State var tempVar: Int = 1
    @Binding var defVar: Int
    let textConfig : TextConfig
    
    
    var userPreferences: UserPreferences
    
    var body: some View {
        ScrollView {
            VStack {
                Text(Texts.cigarettesPerPack)
                    .font(.title2)
                    .minimumScaleFactor(textConfig.scaleFactor)
                    .frame(maxWidth: .infinity, maxHeight: textConfig.maxHeight, alignment: .leading)
                
                OnboardingPicker(selectedNumber: $tempVar)
                    .frame(height: textConfig.frameHeight)
                
                HStack {
                    Text("\(tempVar)")
                        .foregroundStyle(.brandYellow)
                    Text(Texts.returnCigarettesPerPack(number: tempVar))
                }.italic()
                
                
                GenericBackAndNextButton(fowardView: .packCost, backwardsView: .cigaretteCount , tempVar: $tempVar, defVar: $defVar)
                    .padding(.top)
                
            }
            
        }
        .padding(.horizontal)
        .background(
            LinearGradient(colors: [.achievementPurple,
                                    .black.opacity(0.2),
                                    .black], startPoint: .top, endPoint: .bottom)
        )
        .onDisappear{
            userPreferences.cigarettesInPack = defVar
        }
        
    }
}

#Preview {
    CigarettesPerPackView(tempVar: 1, defVar: .constant(200), textConfig: TextConfig(), userPreferences: UserPreferences())
        .environment(PageManager())
}
