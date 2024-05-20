//
//  CigarettesPerPackView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct CigarettesPerPackView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            Text("CigarettesPerPack")
                .padding()
            
            Button("PackCost") {
                pageManager.page = .packCost
            }
            .padding()
        }
    }
}

#Preview {
    CigarettesPerPackView()
        .environment(PageManager())
}
