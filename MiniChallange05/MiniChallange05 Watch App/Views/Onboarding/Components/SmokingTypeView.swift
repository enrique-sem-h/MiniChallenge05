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
    let spacing: CGFloat = 10
    let textConfig : TextConfig
    
    var body: some View {
        ScrollView {
            
            Text(Texts.smokingType)
                .font(.title2)
                .frame(maxWidth: .infinity, maxHeight: textConfig.maxHeight, alignment: .leading)
                .padding(.bottom)
                .minimumScaleFactor(textConfig.scaleFactor)
            
            HStack(spacing: spacing) {
                VStack {
                    CigaretteTypeButton(cigarretTypeView: .cigaretteCount, userPreferences: userPreferences, type: .cigarette)
                        .environment(pageManager)
                    
                    Text(Texts.cigarette)
                    .frame(width: textConfig.frameWidth, height: textConfig.frameHeight)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .lineLimit(lineLimit)
                        .minimumScaleFactor(textConfig.scaleFactor)
                }
                
                VStack {
                    CigaretteTypeButton(cigarretTypeView: .vapeFrequency, userPreferences: userPreferences, type: .eCigarette)
                        .environment(pageManager)
                    
                    Text(Texts.eCigarette)
                    .frame(width: textConfig.frameWidth, height: textConfig.frameHeight)
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .lineLimit(lineLimit)
                        .minimumScaleFactor(textConfig.scaleFactor)
                }
            }
        }.scenePadding(.horizontal)
        
    }
}

#Preview {
    SmokingTypeView(userPreferences: UserPreferences(), textConfig: TextConfig())
        .environment(PageManager())
}
