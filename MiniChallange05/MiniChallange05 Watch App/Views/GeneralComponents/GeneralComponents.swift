//
//  GeneralComponents.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

/// Width of the screen.
let screenWidth = WKInterfaceDevice.current().screenBounds.width

/// Height of the screen.
let screenHeight = WKInterfaceDevice.current().screenBounds.height

/// Button for selecting cigarette type.
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
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            case .eCigarette:
                Image("E-Cig")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}

/// Button for navigating between pages.
struct GenericBackAndNextButton : View{
    
    @Environment(PageManager.self) var pageManager
    let fowardView : Page
    let backwardsView : Page
    @Binding var tempVar: Int
    @Binding var defVar: Int
    
    var body: some View{
        VStack{
            Button(Texts.next) {
                defVar = tempVar
                pageManager.page = fowardView
            }
            .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            
            Button(Texts.back) {
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

