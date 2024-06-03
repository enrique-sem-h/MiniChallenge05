//
//  VapeFrequencyView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct VapeFrequencyView: View {
    @Environment(PageManager.self) var pageManager
    @State var tempVar: Int = 1
    @Binding var defVar: Int
    let textConfig : TextConfig
    
    var userPreferences: UserPreferences
    
    var body: some View {
        ScrollView {
            
            Text("Quantas vezes por dia você costuma fumar?")
                .font(.title2)
                .minimumScaleFactor(textConfig.scaleFacroty)
                .frame(maxWidth: .infinity, maxHeight: textConfig.maxHeight, alignment: .leading)
            
            OnboardingPicker(selectedNumber: $tempVar)
                .frame(height: textConfig.frameHeight)
            
            if tempVar > 1 {
                Text("\(tempVar) vezes por dia")
                    .italic()
            } else {
                Text("\(tempVar) vezes por dia")
                    .italic()
            }
            
            GenericBackAndNextButton(fowardView: .vapeCost, backwardsView: .smokingType , tempVar: $tempVar, defVar: $defVar)
                .padding(.top)
            
        }
        .padding(.horizontal)
        
        .onDisappear{
            userPreferences.vapePerDay = defVar
        }
        
    }
}

#Preview {
    VapeFrequencyView(tempVar: 2, defVar: .constant(200), textConfig: TextConfig(), userPreferences: UserPreferences())
        .environment(PageManager())
}
