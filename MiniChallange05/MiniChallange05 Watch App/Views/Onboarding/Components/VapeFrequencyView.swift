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
    
    static let screenSize = WKInterfaceDevice.current().screenBounds.size
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    
    var body: some View {
        VStack {
            Text("Quantas vezes por dia você costuma fumar?")
                .padding(.bottom, 10)
                .minimumScaleFactor(0.5)
                .frame(width: screenWidth * 0.9, height: screenHeight * 0.2)
            
            OnboardingPicker(selectedNumber: $tempVar)
                .frame(width: screenWidth * 0.4, height: screenHeight * 0.3)
            
            HStack {
                Button("SmokingType") {
                    defVar = tempVar
                    pageManager.page = .smokingType
                }
                .padding()
                Button("VapeFrequency") {
                    defVar = tempVar
                    pageManager.page = .vapeCost
                }
                .padding()
            }
        }
    }
}

#Preview {
    VapeFrequencyView(defVar: .constant(1))
        .environment(PageManager())
}
