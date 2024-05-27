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
            VStack {
                Text("Quantos cigarros por dia você costuma fumar?")
                    .padding(.bottom, 5)
                    .minimumScaleFactor(0.5)
                    .frame(width: screenWidth * 0.9, height: screenHeight * 0.25)
                
                OnboardingPicker(selectedNumber: $tempVar)
                    .frame(width: screenWidth * 0.4, height: screenHeight * 0.3)
                    .padding(.bottom,10)
                
                
                GenericBackAndNextButton(fowardView: .cigarettesPerPack, backwardsView: .smokingType , tempVar: Binding(projectedValue: .constant(tempVar)), defVar: Binding(projectedValue: .constant(defVar)))
                
                
            }
        }.onDisappear{
            userPreferences.cigarsPerDay = defVar
        }
    }
}
