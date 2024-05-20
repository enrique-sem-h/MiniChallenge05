//
//  CigaretteCountView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct CigaretteCountView: View {
    @Environment(PageManager.self) var pageManager
    @State var tempVar: Int = 1
    @Binding var defVar: Int
    
    var body: some View {
        VStack {
            Text("Quantos cigarros por dia você costuma fumar?")
                .padding()
            
            OnboardingPicker(selectedNumber: $tempVar)
            
            Button("VapeFrequency") {
                defVar = tempVar
                pageManager.page = .vapeFrequency
            }
            .padding()
        }
    }
}

#Preview {
    CigaretteCountView(defVar: .constant(1))
        .environment(PageManager())
}
