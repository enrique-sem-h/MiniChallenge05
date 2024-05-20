//
//  CigaretteCountView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct CigaretteCountView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            Text("CigaretteCount")
                .padding()
            
            Button("VapeFrequency") {
                pageManager.page = .vapeFrequency
            }
            .padding()
        }
    }
}

#Preview {
    CigaretteCountView()
        .environment(PageManager())
}
