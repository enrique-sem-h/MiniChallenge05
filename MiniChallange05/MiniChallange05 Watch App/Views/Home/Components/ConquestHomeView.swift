//
//  ConquestHomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct ConquestHomeView: View {
    var body: some View {
        VStack {
            Text("Próxima conquista")
                .padding(.bottom)
            
            HStack {
                Ellipse()
                    .frame(width: 60, height: 60)
                
                VStack {
                    Text("Conquista")
                        .font(.system(size: 14))
                    
                    Text("Complete seu primeiro ano sem fumar")
                    
                    HStack {
                        Text("Progresso")
                        Spacer()
                        Text("86%")
                    }
                    RoundedRectangle(cornerRadius: 6)
                        .frame(height: 50)
                }
            }
        }
        .padding(.horizontal)
        .background(.purple.opacity(0.8))
    }
}

#Preview {
    ConquestHomeView()
}
