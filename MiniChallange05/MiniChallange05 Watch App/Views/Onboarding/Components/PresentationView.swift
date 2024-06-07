//
//  PresentationView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

/// Displays the presentation screen with onboarding information.
struct PresentationView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        ScrollView {
            
            Image("Welcome")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(Texts.presentation)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
                .minimumScaleFactor(0.7)
            
            Text(Texts.onboardingInformations)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.bottom, 10)
                .minimumScaleFactor(0.5)
            
            Text(Texts.onboardingInformations2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.bottom, 10)
                .minimumScaleFactor(0.5)
            
            Button {
                pageManager.page = .smokingType
            } label: {
                Text(Texts.continueText)
                    .bold()
            }
            .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .padding(.horizontal)
        .background(
            LinearGradient(colors: [.achievementPurple,
                                    .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    PresentationView()
        .environment(PageManager())
}

