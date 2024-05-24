//
//  HealthHomeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 22/05/24.
//

import SwiftUI

struct HealthHomeView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.gray.opacity(0.6))
                .frame(width: 160, height: 90)
                .overlay {
                    Text("A partir de hoje a oxigenação do seu sangue voltou 100% ao normal!")
            }
        }
        .background(.red.opacity(0.8))
    }
}

#Preview {
    HealthHomeView()
}
