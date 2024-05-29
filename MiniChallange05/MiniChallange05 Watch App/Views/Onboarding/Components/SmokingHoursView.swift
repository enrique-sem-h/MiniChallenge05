//
//  SmokingHoursView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

struct SmokingHoursView: View {
    @Environment(PageManager.self) var pageManager
    @Binding var viewAnterior: Page
    
    var userPreferences: UserPreferences
    
    @Binding var items: [Date]
    @Binding var selectedItems: Set<Date>
    
    var body: some View {
        ScrollView {
            HeaderView()
            
            ForEach(items, id: \.self) { item in
                RowRectangle(date: item, isSelected: selectedItems.contains(item)) {
                    if selectedItems.contains(item) {
                        selectedItems.remove(item)
                    } else {
                        selectedItems.insert(item)
                    }
                }
                .frame(height: 40)
                .padding()
            }
            
            Spacer()
            
            VStack {
                Button("Finalizar") {
                    
                    userPreferences.hourSmoke = Array(selectedItems)
                    
                    if userPreferences.smokingType.rawValue == UserModel.SmokeType.cigarette.rawValue {
                        guard let cigarsPerDay = userPreferences.cigarsPerDay else { return }
                        guard let cigarettesInPack = userPreferences.cigarettesInPack else { return }
                        
                        DataManager.shared.userModel = UserModel(startStreak: .now, cigarsType: userPreferences.smokingType, cigarsPerDay: Int16(cigarsPerDay), cigarettesInPack: Int16(cigarettesInPack), smokeCost: userPreferences.smokeCost, hourSmoke: userPreferences.hourSmoke, quitDay: .now)
                        DataManager.shared.createUser()
                    } else {
                        guard let vapePerDay = userPreferences.vapePerDay else { return }
                        
                        DataManager.shared.userModel = UserModel(startStreak: .now, cigarsType: userPreferences.smokingType, vapePerDay: Int16(vapePerDay), smokeCost: userPreferences.smokeCost, hourSmoke: userPreferences.hourSmoke, quitDay: .now)
                        DataManager.shared.createUser()
                    }
                    
                    pageManager.page = .homeView
                    
                }
                
                Button("Voltar") {
                    pageManager.page = viewAnterior
                }
                
                
            }
            .padding()
        }
    }
}

struct HeaderView: View {
    @Environment(PageManager.self) var pageManager
    
    var body: some View {
        HStack {
            Text("Em que horários você fuma?")
                .padding(.bottom, 10)
                .minimumScaleFactor(0.5)
                .frame(width: screenWidth * 0.9, height: screenHeight * 0.22)
            
            Spacer()
            
            Button(action: {
                pageManager.page = .createSmokingHour
            }, label: {
                Image(systemName: "plus")
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct RowRectangle: View {
    var date: Date
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            Text(formatDate(date))
                .foregroundColor(.white)
        })
        .buttonBorderShape(.roundedRectangle(radius: 6))
        .tint(isSelected ? .blue : .gray)
        
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = .autoupdatingCurrent
        formatter.timeStyle = .short
        formatter.timeZone = .autoupdatingCurrent
        return formatter.string(from: date)
    }
    
}
