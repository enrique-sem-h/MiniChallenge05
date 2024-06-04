//
//  HealthProgressComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct ProgressComponent: View {
    var title: String = Texts.title
    var porcentagem: Float = 0.5
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(.gray.opacity(0.7))
            .frame(width: screenWidth, height: screenHeight * 0.4)
            .overlay {
                VStack {
                    HStack {
                        Image(systemName: "heart.fill")
                        
                        Spacer()
                        
                        let p = Int(porcentagem * 100)
                        Text("\(Int(p))%")
                    }
                    .padding()
                    
                    HStack {
                        Text(title)
                        Spacer()
                    }
                    .padding()
                    
                    ProgressView(value: porcentagem)
                        .scaleEffect(CGSize(width: 1, height: 0.5))
                }
            }
    }
}

#Preview {
    ProgressComponent()
}
