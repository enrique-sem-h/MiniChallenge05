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
    let textConfig : TextConfig
    var userPreferences: UserPreferences
    let notificationHandler = LocalNotifications()
    
    @Binding var items: [Date]
    @Binding var selectedItems: Set<Date>
    
    var body: some View {
        ScrollView {
            
            Text(Texts.smokingHoursQuestion)
                .font(.title2)
                .minimumScaleFactor(textConfig.scaleFactor)
                .frame(maxWidth: .infinity, maxHeight: textConfig.frameHeight, alignment: .leading)
                .padding(.bottom)
            
            ForEach(items, id: \.self) { item in
                RowRectangle(date: item, isSelected: selectedItems.contains(item)) {
                    if selectedItems.contains(item) {
                        selectedItems.remove(item)
                    } else {
                        selectedItems.insert(item)
                    }
                }

            }
            
            Button(action: {
                pageManager.page = .createSmokingHour
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .bold()
                    .padding(15)
                    .background(Color(red: 68 / 255, green: 17 / 255, blue: 190 / 255, opacity: 0.4 / 1))
                    .clipShape(Circle())
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom)
            
            VStack {
                Button(Texts.done) {
                    
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
                    
                    notificationHandler.schedule()
                    pageManager.page = .homeView
                    
                }
                .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255))
                .foregroundStyle(.white)
                .clipShape(Capsule())
                
                Button(Texts.back) {
                    pageManager.page = viewAnterior
                }
                .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255, opacity: 0.5 / 1))
                .foregroundStyle(.white)
                .clipShape(Capsule())
            }
            .padding(.horizontal)
        }
    }
}

struct RowRectangle: View {
    var date: Date
    @State var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
     
        Button(action: {
            onTap()
            isSelected.toggle()
        }, label: {
            Text(formatDate(date))
                .foregroundStyle(.white)
            Spacer()
            Image(systemName: isSelected ? "checkmark" : "circle")
                                .foregroundColor(isSelected ? .green : .primary)
        })
        .background(Color.Resolved(red: 68 / 255, green: 17 / 255, blue: 190 / 255, opacity: 0.2 / 1))
        .buttonBorderShape(.roundedRectangle(radius: 6))
        
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = .autoupdatingCurrent
        formatter.timeStyle = .short
        formatter.timeZone = .autoupdatingCurrent
        return formatter.string(from: date)
    }
    
}

#Preview {
    SmokingHoursView(viewAnterior: .constant(.vapeCost), textConfig: TextConfig(), userPreferences: UserPreferences(), items: .constant([
        Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 22, minute: 0, second: 0, of: Date())!
    ]), selectedItems: .constant([Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!]))
    .environment(PageManager())
}
