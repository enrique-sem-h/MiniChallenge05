//
//  VapeCostView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct VapeCostView: View {
    @Environment(PageManager.self) var pageManager
    @State var tempVar: Int = 1
    @Binding var defVar: Int
    @Binding var viewAtual: Page
    
    static let screenSize = WKInterfaceDevice.current().screenBounds.size
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    
    var body: some View {
        VStack {
            Text("Quanto você gasta por mês com cigarro eletrônico?")
                .padding(.bottom, 10)
                .minimumScaleFactor(0.5)
                .frame(width: screenWidth * 0.9, height: screenHeight * 0.2)
            
            OnboardingPicker(selectedNumber: $tempVar)
                .frame(width: screenWidth * 0.4, height: screenHeight * 0.3)
            
            HStack {
                Button("SmokingType") {
                    defVar = tempVar
                    pageManager.page = .vapeFrequency
                }
                .padding()
                Button("VapeFrequency") {
                    defVar = tempVar
                    pageManager.page = .smokingHours
                    viewAtual = .vapeCost
                }
                .padding()
            }
        }
    }
}

#Preview {
    VapeCostView(defVar: .constant(1), viewAtual: .constant(.packCost))
        .environment(PageManager())
}
