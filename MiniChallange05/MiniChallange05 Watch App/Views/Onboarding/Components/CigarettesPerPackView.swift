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
    
    var userPreferences: UserPreferences
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Quantos cigarros tem no maço que você compra?")
                    .font(.title2)
                    .minimumScaleFactor(0.7)
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                
                OnboardingPicker(selectedNumber: $tempVar)
                    .frame(height: 85)
                
                if tempVar > 1 {
                    Text("\(tempVar) cigarros por maço")
                        .italic()
                } else {
                    Text("\(tempVar) cigarro por maço")
                        .italic()
                }
                
                GenericBackAndNextButton(fowardView: .packCost, backwardsView: .cigaretteCount , tempVar: $tempVar, defVar: $defVar)
                    .padding(.top)
                
            }
            
        }
        
        .padding(.horizontal)
        
        .onDisappear{
            userPreferences.cigarettesInPack = defVar
        }
    }
}

#Preview {
    CigarettesPerPackView(tempVar: 1, defVar: .constant(200), userPreferences: UserPreferences())
        .environment(PageManager())
}
