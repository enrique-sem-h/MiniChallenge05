//
//  HealthDetailComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

/// Displays the detailed information about health progress.
struct ProgressDetailComponent: View {
    @State var percentage: Float = 0.8
    @State var healthType: String = Texts.bloodOxygen
    @State var aboutText: String = Texts.aboutText
    @State var sourceText: String = Texts.sourceText
    
    var body: some View {
        
        ScrollView {
            
            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                Spacer()
                let p = Int(percentage * 100)
                Text("\(Int(p))%")
            }
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(healthType)
                .font(.title2)
            
            HStack {
                Text(Texts.about)
                    .font(.title3)
                Spacer()
            }
            .padding(.top)
            
            Text(aboutText)
            
            HStack {
                Text(Texts.source)
                    .font(.title3)
                Spacer()
            }
            .padding(.top)
            
            Text(sourceText)
            
        }.scenePadding(.horizontal)
    }
}

#Preview {
    ProgressDetailComponent()
}

