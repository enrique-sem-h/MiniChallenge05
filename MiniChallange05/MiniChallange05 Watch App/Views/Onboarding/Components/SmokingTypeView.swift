//
//  SmokingTypeView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI
import WatchKit

struct SmokingTypeView: View {
    @Environment(PageManager.self) var pageManager
    
    
    var body: some View {
        VStack {
            
            Text("O que você fuma atualmente?")
                .font(.headline)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                .padding(.bottom, 10)
                .minimumScaleFactor(0.7)
            
            //Container with both buttons and texts
            HStack{
                
                //Container with one button and one text
                VStack{
                    
                    //Component with the button style in this screen
                    CigaretteTypeButton()
                        .environment(pageManager)
                    
                    Text("Cigarro Convencional")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.7)
                }
                
                VStack{
                    CigaretteTypeButton()
                        .environment(pageManager)
                    
                    Text("Cigarro eletronico")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .minimumScaleFactor(0.7)
                }
            }
            
            
        }
    }
}

#Preview {
    SmokingTypeView()
        .environment(PageManager())
}
