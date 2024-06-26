//
//  PackCostView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct PackCostView: View {
    @Environment(PageManager.self) var pageManager
    @State var tempVar: Int = 1
    @Binding var defVar: Int
    @Binding var viewAtual: Page
    
    var userPreferences: UserPreferences
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Quanto custa o maço de cigarro?")
                    .padding(.bottom, 5)
                    .minimumScaleFactor(0.5)
                    .frame(width: screenWidth * 0.9, height: screenHeight * 0.18)
                
                HStack(alignment: .center){
                    Text(Locale.current.currencySymbol ?? "R$")
                    OnboardingPicker(selectedNumber: $tempVar)
                }.frame(width: screenWidth * 0.4, height: screenHeight * 0.3)
                    .padding(.bottom,10)
                
                GenericBackAndNextButton(fowardView: .smokingHours, backwardsView: .cigarettesPerPack, tempVar: $tempVar, defVar: $defVar)
                
                
            }
        }.onDisappear{
            userPreferences.smokeCost = Double(defVar)
        }
    }
}
