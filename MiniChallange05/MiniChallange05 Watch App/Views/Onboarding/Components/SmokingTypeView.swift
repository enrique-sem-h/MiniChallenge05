//
//  SmokingTypeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI
import WatchKit

// Esta estrutura define uma visualização para configurar o tipo de fumo, seja cigarro ou cigarro eletrônico, usando SwiftUI.
// A visualização permite ao usuário selecionar entre cigarro tradicional e cigarro eletrônico.
struct SmokingTypeView: View {
    @Environment(PageManager.self) var pageManager
    var userPreferences: UserPreferences
    let lineLimit = 2
    let spacing: CGFloat = 10
    let height = 40
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
                        .frame(width: textConfig.frameWidth)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .lineLimit(lineLimit)
                        .minimumScaleFactor(textConfig.scaleFactor)
                }
                
                VStack {
                    CigaretteTypeButton(cigarretTypeView: .vapeFrequency, userPreferences: userPreferences, type: .eCigarette)
                        .environment(pageManager)
                    
                    Text(Texts.eCigarette)
                        .frame(width: textConfig.frameWidth)
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .lineLimit(lineLimit)
                        .minimumScaleFactor(textConfig.scaleFactor)
                }
            }
        }
        .padding(.horizontal)
        .background(
            LinearGradient(colors: [.achievementPurple,
                .black.opacity(0.2),
                .black], startPoint: .top, endPoint: .bottom)
        )
    
    }
}

#Preview {
    SmokingTypeView(userPreferences: UserPreferences(), textConfig: TextConfig())
        .environment(PageManager())
}
