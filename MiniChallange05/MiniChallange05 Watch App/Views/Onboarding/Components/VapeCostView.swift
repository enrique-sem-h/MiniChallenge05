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
        ScrollView {
            VStack {
                Text("Quanto você gasta por mês com cigarro eletrônico?")
                    .padding(.bottom, 5)
                    .minimumScaleFactor(0.5)
                    .frame(width: screenWidth * 0.9, height: screenHeight * 0.25)
                
                HStack(alignment: .bottom){
                    Text(Locale.current.currencySymbol ?? "R$")
                    OnboardingPicker(selectedNumber: $tempVar)
                }.frame(width: screenWidth * 0.4, height: screenHeight * 0.3)
                    .padding(.bottom,10)

                    GenericBackAndNextButton(fowardView: .smokingHours, backwardsView: .vapeFrequency , tempVar: $tempVar, defVar: $defVar)

            }
        }
    }
}

#Preview {
    VapeCostView(defVar: .constant(1), viewAtual: .constant(.packCost))
        .environment(PageManager())
}
