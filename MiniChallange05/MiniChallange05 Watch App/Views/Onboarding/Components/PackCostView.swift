//
//  PackCostView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct PackCostView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            Text("PackCost")
                .padding()
            
            Button("vapeCost") {
                pageManager.page = .vapeCost
            }
            .padding()
        }
    }
}

#Preview {
    PackCostView()
        .environment(PageManager())
}
