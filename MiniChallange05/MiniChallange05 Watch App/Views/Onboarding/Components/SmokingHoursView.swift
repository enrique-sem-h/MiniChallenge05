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
    
    static let screenSize = WKInterfaceDevice.current().screenBounds.size
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    
    @State var items: [Date] = [
        Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 18, minute: 0, second: 0, of: Date())!,
        Calendar.current.date(bySettingHour: 22, minute: 0, second: 0, of: Date())!
    ]
    @State private var selectedItems: Set<Date> = []
    
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
            
            HStack {
                Button("voltar") {
                    pageManager.page = viewAnterior
                }
                .padding()
                Button("finalizar") {
                    pageManager.page = .createSmokingHour
                }
                .padding()
                
            }
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
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }
}

#Preview {
    SmokingHoursView(viewAnterior: .constant(.packCost))
        .environment(PageManager())
}
