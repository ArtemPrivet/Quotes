//
//  QuotesWidget.swift
//  QuotesWidget
//
//  Created by Artem Orlov on 03.10.23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @State var quote: String = ""

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), quote: quote)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), quote: quote)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, quote: quote)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let quote: String
}

struct QuotesWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.quote)
            .padding()
    }
}

struct QuotesWidget: Widget {
    let kind: String = "QuotesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            QuotesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct QuotesWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuotesWidgetEntryView(entry: SimpleEntry(date: Date(), quote: "Spread love everywhere you go. Let no one ever come to you without leaving happier."))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
