//
//  HealthProgressComponent.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct HealthProgressComponent: View {
    var title: String = "Title"
    var porcentagem: Float = 0.5
    
    static let screenSize = WKInterfaceDevice.current().screenBounds.size
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    
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
                }
            }
    }
}

#Preview {
    HealthProgressComponent()
}
