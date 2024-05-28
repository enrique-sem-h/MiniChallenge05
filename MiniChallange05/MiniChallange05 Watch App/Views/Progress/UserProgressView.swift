//
//  HealthProgressView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct UserProgressView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundStyle( .background)
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    ForEach( 0..<20) {_ in
                        NavigationLink {
                            ProgressDetailComponent()
                        } label: {
                            ProgressComponent(title: "pepinos", porcentagem: 0.7)
                        }//Tá tendo bug com a navigationLink
                        
                    }
                }
                
            }
            .navigationTitle("Progresso")
        }
    }
}

#Preview {
    UserProgressView()
}
