//
//  PresentationView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct PresentationView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        VStack {
            
            Text("Apresentação do App")
                .font(.title3)
                .bold()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.bottom, 10)
                .minimumScaleFactor(0.7)
            
            Text("Para começar, precisamos que insira algumas inforamções a seguir.")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .font(.footnote)
                .padding(.bottom, 10)
                .minimumScaleFactor(0.5)
            
            Button {
                pageManager.page = .smokingType
            } label: {
                Text("Continuar")
                    .bold()
            }
            .background(Color.gray)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
    }
}

#Preview {
    PresentationView()
        .environment(PageManager())
}
