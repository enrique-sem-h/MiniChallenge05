//
//  HealthProgressView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct UserProgressView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle( .background)
                .ignoresSafeArea()
            
            ScrollView {
                Text("Progresso")
                
                ForEach( 0..<20) {_ in 
                    HealthProgressComponent(title: "pepinos", porcentagem: 0.7)
                }
                
            }
        }
        
        
    }

}

#Preview {
    UserProgressView()
}
