//
//  GeneralComponents.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

let screenWidth = WKInterfaceDevice.current().screenBounds.width
let screenHeight = WKInterfaceDevice.current().screenBounds.height

//Button with in the onboarding2 View with the same interface and just a different navigation behavior
struct CigaretteTypeButton : View {
    
    @Environment(PageManager.self) var pageManager : PageManager
    let cigarretTypeView : Page
    var userPreferences: UserPreferences
    var type: UserModel.SmokeType
    
    var body: some View {
        
        Button(action: {
            pageManager.page = cigarretTypeView
            userPreferences.smokingType = type
        }, label: {
            switch type {
            case .cigarette:
                Image("Cigarette")
                    .resizable()
                    .scaledToFit()
//                    .frame(width: screenWidth * 0.4)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            case .eCigarette:
                Image("E-Cig")
                    .resizable()
                    .scaledToFit()
//                    .frame(width: screenWidth * 0.4)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}

//Generic button that push forward and backwards the flow of the onboarding
struct GenericBackAndNextButton : View{
    
    @Environment(PageManager.self) var pageManager
    let fowardView : Page
    let backwardsView : Page
    @Binding var tempVar: Int
    @Binding var defVar: Int
    
    var body: some View{
        VStack{
            Button("Próximo") {
                defVar = tempVar
                pageManager.page = fowardView
            }
            .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            
            Button("Voltar") {
                defVar = tempVar
                pageManager.page = backwardsView
            }
            .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255, opacity: 0.5 / 1))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            
        }
    }
}

#Preview {
    GenericBackAndNextButton(fowardView: .cigarettesPerPack, backwardsView: .smokingType, tempVar: .constant(2), defVar: .constant(200))
        .environment(PageManager())
}
