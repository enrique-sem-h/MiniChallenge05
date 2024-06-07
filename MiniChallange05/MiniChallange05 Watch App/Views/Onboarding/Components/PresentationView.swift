//
//  PresentationView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

// Esta estrutura define uma visualização de apresentação para o aplicativo, mostrando uma imagem de boas-vindas, texto de apresentação e um botão para continuar.
struct PresentationView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        ScrollView {
            
            Image("Welcome")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Text(Texts.presentation)
                .font(.title3)
                .bold()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.bottom, 10)
                .minimumScaleFactor(0.7)
            
            Text(Texts.onboardingInformations)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .font(.footnote)
                .padding(.bottom, 10)
                .minimumScaleFactor(0.5)
            
            Text(Texts.onboardingInformations2)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
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
