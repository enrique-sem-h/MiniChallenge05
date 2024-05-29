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
    
    var body: some View {
        ScrollView {
            
            Text("O que você \nfuma \natualmente?")
                .font(.title2)
                .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
                .padding(.bottom)
                .minimumScaleFactor(0.7)
            
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
                        .lineLimit(2)
                        .minimumScaleFactor(0.7)
                        .frame(height: 30)
                }
                
                VStack {
                    CigaretteTypeButton(cigarretTypeView: .vapeFrequency, userPreferences: userPreferences, type: .eCigarette)
                        .environment(pageManager)
                    
                    Text("Cigarro eletronico")
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .frame(height: 30)
                }
            }
    
        }.scenePadding(.horizontal)
        
    }
}

#Preview {
    SmokingTypeView(userPreferences: UserPreferences())
        .environment(PageManager())
}
