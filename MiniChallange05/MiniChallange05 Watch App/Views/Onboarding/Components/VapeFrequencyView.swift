//
//  VapeFrequencyView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct VapeFrequencyView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            Text("VapeFrequency")
                .padding()
            
            Button("CigarettesPerPack") {
                pageManager.page = .cigarettesPerPack
            }
            .padding()
        }
    }
}

#Preview {
    VapeFrequencyView()
        .environment(PageManager())
}
