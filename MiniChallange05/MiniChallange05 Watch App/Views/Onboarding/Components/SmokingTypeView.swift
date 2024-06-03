//
//  SmokingTypeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI
import WatchKit

struct SmokingTypeView: View {
    @Environment(PageManager.self) var pageManager
    var userPreferences: UserPreferences
    let lineLimit = 2
    let textConfig : TextConfig
    
    var body: some View {
        ScrollView {
            
            Text("O que você fuma atualmente?")
                .font(.title2)
                .frame(maxWidth: .infinity, maxHeight: textConfig.maxHeight, alignment: .leading)
                .padding(.bottom)
                .minimumScaleFactor(textConfig.scaleFacroty)
            
            //Container with both buttons and texts
            HStack {
                
                //Container with one button and one text
                VStack {
                    
                    //Component with the button style in this screen
                    CigaretteTypeButton(cigarretTypeView: .cigaretteCount, userPreferences: userPreferences, type: .cigarette)
                        .environment(pageManager)
                    
                    Text("Cigarro Convencional")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .lineLimit(lineLimit)
                        .minimumScaleFactor(textConfig.scaleFacroty)
                        .frame(height: textConfig.frameHeight)
                }
                
                VStack {
                    CigaretteTypeButton(cigarretTypeView: .vapeFrequency, userPreferences: userPreferences, type: .eCigarette)
                        .environment(pageManager)
                    
                    Text("Cigarro eletronico")
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .lineLimit(lineLimit)
                        .minimumScaleFactor(textConfig.scaleFacroty)
                        .frame(height: textConfig.frameHeight)
                }
            }
    
        }.scenePadding(.horizontal)
        
    }
}

#Preview {
    SmokingTypeView(userPreferences: UserPreferences(), textConfig: TextConfig())
        .environment(PageManager())
}
