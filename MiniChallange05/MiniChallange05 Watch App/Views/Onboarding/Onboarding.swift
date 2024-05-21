//
//  Onboarding1View.swift
//  MiniChallange05 Watch App
//
//  Created by Kaua Miguel on 17/05/24.
//

import SwiftUI

//Aqui estará os states, Environments, e métodos de navegação

//Navegação de possíveis telas
enum Page {
    case presentation
    case smokingType
    case cigaretteCount
    case vapeFrequency
    case cigarettesPerPack
    case packCost
    case vapeCost
    case smokingHours
    case createSmokingHour
}



@Observable class PageManager {
    var page: Page = .presentation
}

struct Onboard: View {
    @Environment(PageManager.self) var pageManager
    @State var defnumero: Int = 1
    @State var viewAnterior:Page = .packCost
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        switch pageManager.page {
        case .presentation:
            PresentationView()
        case .smokingType:
            SmokingTypeView()
        case .cigaretteCount:
            CigaretteCountView(defVar: $defnumero)
        case .vapeFrequency:
            VapeFrequencyView(defVar: $defnumero)
        case .cigarettesPerPack:
            CigarettesPerPackView(defVar: $defnumero)
        case .packCost:
            PackCostView(defVar: $defnumero, viewAtual: $viewAnterior)
        case .vapeCost:
            VapeCostView(defVar: $defnumero, viewAtual: $viewAnterior)
        case .smokingHours:
            SmokingHoursView(viewAnterior: $viewAnterior)
        case .createSmokingHour:
            CreateSmokingHourView()
        }
    }
}

#Preview {
    Onboard()
        .environment(PageManager())
}
