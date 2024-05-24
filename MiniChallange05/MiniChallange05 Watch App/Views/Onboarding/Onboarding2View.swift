//
//  Onboarding2View.swift
//  MiniChallange05 Watch App
//
//  Created by Victor Hugo Pacheco Araujo on 19/05/24.
//

import SwiftUI

struct Onboarding2View: View {
        
    @Binding var estados: AllViews
    
    @State var cigarros = 0

    var body: some View {
        
        if let firstUser = UserDataManager.shared.user {
            Text("\(firstUser.cigarrosPorDia)")
        }

    }
}

#Preview {
    Onboarding2View(estados: .constant(.onboarding1))
}
