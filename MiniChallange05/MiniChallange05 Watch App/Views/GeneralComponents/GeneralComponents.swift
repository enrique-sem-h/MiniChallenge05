//
//  GeneralComponents.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

struct CigaretteTypeButton : View{
    
    @Environment(PageManager.self) var pageManager : PageManager
    let width = WKInterfaceDevice.current().screenBounds.width
    let heigth = WKInterfaceDevice.current().screenBounds.height
    
    var body: some View{
        Button(action: {
            pageManager.page = .cigaretteCount
        }, label: {
            Rectangle()
                .frame(width: width / 2.2)
                .cornerRadius(8.0)
        })
        .buttonStyle(PlainButtonStyle())
    }
}

//struct GenericForward

