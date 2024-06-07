//
//  CreateSmokingHourView.swift
//  MiniChallange05 Watch App
//
//  Created by Giovanni Favorin de Melo on 17/05/24.
//

import SwiftUI

/// A view for creating a smoking hour.
struct CreateSmokingHourView: View {
    @Environment(PageManager.self) var pageManager
    
    @State var data: Date = .now
    
    @Binding var items: [Date]
    @Binding var selectedItems: Set<Date>
    
    var body: some View {
        VStack(alignment: .leading){
            Button{
                pageManager.page = .smokingHours
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .bold()
                    .frame(width: 17, height: 17)
                    .padding(.bottom)
            }
            .buttonStyle(PlainButtonStyle())
            if Locale.current.language.region == "US" && Locale.current.language.languageCode == "en" {
                DatePicker("", selection: $data, displayedComponents: [.hourAndMinute])
            } else {
                DatePicker("", selection: $data, displayedComponents: [.hourAndMinute])
                    .overlay {
                        HStack {
                            Spacer()
                            Rectangle()
                                .frame(width: 7, height: 40)
                                .foregroundStyle(.black)
                        }
                    }
            }
            Button(Texts.confirm) {
                items.append(data)
                selectedItems.insert(data)
                pageManager.page = .smokingHours
            }
            .background(Color(red: 89 / 255, green: 53 / 255, blue: 233 / 255))
            .foregroundStyle(.white)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

#Preview {
    CreateSmokingHourView(
        items: .constant([.now]), selectedItems: .constant([.now])
    )
    .environment(PageManager())
}

