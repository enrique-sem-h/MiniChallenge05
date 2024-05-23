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
    
    static let screenSize = WKInterfaceDevice.current().screenBounds.size
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    var userPreferences: UserPreferences
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Quantos cigarros tem no maço que você compra?")
                    .padding(.bottom, 5)
                    .minimumScaleFactor(0.5)
                    .frame(width: screenWidth * 0.9, height: screenHeight * 0.25)
                
                OnboardingPicker(selectedNumber: $tempVar)
                    .frame(width: screenWidth * 0.4, height: screenHeight * 0.3)
                    .padding(.bottom, 10)
                
                GenericBackAndNextButton(fowardView: .packCost, backwardsView: .cigaretteCount , tempVar: $tempVar, defVar: $defVar)
                
            }
        }.onDisappear{
            userPreferences.cigarettesInPack = defVar
        }
    }
}
