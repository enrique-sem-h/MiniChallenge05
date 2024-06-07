//
//  WidgetAppleWatch.swift
//  WidgetAppleWatch
//
//  Created by Victor Hugo Pacheco Araujo on 05/06/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    private let user = DataManager.shared.userModel
        
        func placeholder(in context: Context) -> StreakEntry {
            return StreakEntry(date: Date(), streak: 20)
        }
        
        func getSnapshot(in context: Context, completion: @escaping (StreakEntry) -> ()) {
            let entry = createEntry()
            completion(entry)
        }
        
        func getTimeline(in context: Context, completion: @escaping (Timeline<StreakEntry>) -> ()) {
            let entry = createEntry()
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
        
        private func createEntry() -> StreakEntry {
            
            guard let startStreak = user?.startStreak else {
                return StreakEntry(date: Date(), streak: 100)
            }
            
            let streak = calculateStreak(from: startStreak, to: Date())
            return StreakEntry(date: Date(), streak: streak)
        }
        
        private func calculateStreak(from startDate: Date, to endDate: Date) -> Int {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.minute], from: startDate, to: endDate)
            let minutes = components.minute ?? 0
            return minutes
        }
}

struct StreakEntry: TimelineEntry {
    let date: Date
    let streak: Int
}

struct WidgetAppleWatchEntryView : View {

    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family

    var body: some View {
        
        ZStack {
            AccessoryWidgetBackground()
            
            switch family {
            case .accessoryCorner:
                Image("widget")
                    .resizable()
                    .scaledToFit()
           
            case .accessoryCircular:
                VStack {
//                    let duration = calculateStreak(from: user?.startStreak ?? .distantPast, to: Date())
//                    if duration > 0 {
                        Text("\(entry.streak)min")
//                    } else {
//                        Text("Sem dado")
//                    }
                }
                
            default:
                Image("widget")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
        
    }
    
   
    
}

@main
struct WidgetAppleWatch: Widget {
    let kind: String = "WidgetAppleWatch"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(watchOS 10.0, *) {
                WidgetAppleWatchEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WidgetAppleWatchEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("NicQuit!")
        .description("You can access the app here.")
        .supportedFamilies([.accessoryCircular, .accessoryCorner])
    }
}

#Preview(as: .accessoryCorner) {
    WidgetAppleWatch()
} timeline: {
    StreakEntry(date: Date(), streak: 0)
}

#Preview(as: .accessoryCircular) {
    WidgetAppleWatch()
} timeline: {
    StreakEntry(date: Date(), streak: 0)
}
