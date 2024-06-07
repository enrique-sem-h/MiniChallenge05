//
//  WidgetAppleWatch.swift
//  WidgetAppleWatch
//
//  Created by Victor Hugo Pacheco Araujo on 05/06/24.
//

import WidgetKit
import SwiftUI

// Este arquivo define um widget para o Apple Watch usando SwiftUI e WidgetKit.
// O widget exibe uma imagem de ícone em diferentes formatos de widgets (acessórios circulares e de canto),
// com uma linha do tempo de atualizações a cada hora.
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), icon: "widget")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), icon: "widget")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, icon: "widget")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let icon: String
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
                Image("widget")
                    .resizable()
                    .scaledToFit()
                    .padding()
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
    SimpleEntry(date: .now, icon: "widget")
}

#Preview(as: .accessoryCircular) {
    WidgetAppleWatch()
} timeline: {
    SimpleEntry(date: .now, icon: "widget")
}
