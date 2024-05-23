//
//  HealthProgressView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct HealthProgressView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle( .background)
                .ignoresSafeArea()
            
            ScrollView {
                Text("Progresso da Saúde")
                
            }
        }
        
        
    }

}

#Preview {
    HealthProgressView()
}

#Preview {
    ContentView()
}
