//
//  ConquestHomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct ConquestHomeView: View {
    
    @State var porcentagem: Float = 0.8
    @State var achievementText: String = "Complete seu primeiro ano sem fumar"
    
    var body: some View {
        VStack {
            Text("Próxima conquista")
                .lineLimit(1)
                .font(.title3)
                .padding(.bottom)
                .minimumScaleFactor(0.6)
            
            HStack(alignment: .top) {
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxWidth: screenWidth * 0.35, maxHeight: screenHeight * 0.3)
                
                VStack {
                    
                    Text(achievementText)
                        .padding(.leading)
                        .padding(.bottom)
                    
                    HStack {
                        Spacer()
                        let p = Int(porcentagem * 100)
                        Text("\(Int(p))%")
                    }
                    
                    ProgressView(value: porcentagem)
                        .scaleEffect(CGSize(width: 1, height: 0.5))
            
                }
                
            }
        }
        
    }
}

#Preview {
    ConquestHomeView()
}
