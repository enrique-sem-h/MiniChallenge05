//
//  SmokingTypeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct SmokingTypeView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            Text("SmokingType")
                .padding()
            
            Button("CigaretteCount") {
                pageManager.page = .cigaretteCount
            }
            .padding()
        }
    }
}

#Preview {
    SmokingTypeView()
        .environment(PageManager())
}
