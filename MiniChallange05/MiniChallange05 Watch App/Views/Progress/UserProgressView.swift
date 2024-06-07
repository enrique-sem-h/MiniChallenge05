//
//  HealthProgressView.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

// Esta estrutura define a visualização do progresso do usuário, que exibe uma lista de componentes de economia.
struct UserProgressView: View {
    var body: some View {
        ScrollView {
            HStack {
                Text(Texts.progress)
                    .font(.title2)
                    .bold()
                Spacer()
            }
            SavingsComponent()
            
        }
        .padding(.horizontal)
        .background(
            LinearGradient(colors: [.achievementPurple,
                                    .black.opacity(0.2),
                                    .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserProgressView()
}
