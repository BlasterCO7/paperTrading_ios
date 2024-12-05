//
//  TimeLine.swift
//  paperTrading
//
//  Created by Piyush Anand on 24/11/24.
//

import Foundation
import SwiftUI
struct TimelineButton: View {
    let timeline: Timeline
    @Binding var selectedTimeline: Timeline
    var onSelect: (Timeline) -> Void

    var body: some View {
        Button(action: {
            selectedTimeline = timeline
            onSelect(timeline)
        }) {
            Text(timelineTitle)
                .padding()
                .background(selectedTimeline == timeline ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }

    private var timelineTitle: String {
        switch timeline {
        case .oneDay: return "1 Day"
        case .oneWeek: return "1 Week"
        case .oneMonth: return "1 Month"
        }
    }
}

enum Timeline {
    case oneDay
    case oneWeek
    case oneMonth
}
