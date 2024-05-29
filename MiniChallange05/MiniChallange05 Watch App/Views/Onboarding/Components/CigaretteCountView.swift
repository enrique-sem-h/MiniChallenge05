//
//  CigaretteCountView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI
import WatchKit

struct CigaretteCountView: View {
    @Environment(PageManager.self) var pageManager
    @State var tempVar: Int = 1
    @Binding var defVar: Int
    var userPreferences: UserPreferences
    
    var body: some View {
        
        ScrollView {
            
            Text("Quantos cigarros por dia você costuma fumar?")
                .font(.title2)
                .minimumScaleFactor(0.7)
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
            
            OnboardingPicker(selectedNumber: $tempVar)
                .frame(height: 85)
            
            if tempVar > 1 {
                Text("\(tempVar) cigarros por dia")
                    .italic()
            } else {
                Text("\(tempVar) cigarro por dia")
                    .italic()
            }
            
            GenericBackAndNextButton(fowardView: .cigarettesPerPack, backwardsView: .smokingType , tempVar: $tempVar, defVar: $defVar)
                .padding(.top)
            
        }
        
        .padding(.horizontal)
        
        .onDisappear{
            userPreferences.cigarsPerDay = defVar
        }
        
    }
}

#Preview {
    let pageManager = PageManager()
    return CigaretteCountView(tempVar: 2, defVar: .constant(200), userPreferences: UserPreferences())
        .environment(pageManager)
}
