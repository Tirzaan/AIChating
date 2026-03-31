//
//  Date+Ext.swift
//  AIChating
//
//  Created by Tirzaan on 3/24/26.
//

import Foundation
import SwiftUI

extension Date {
    func addingTimeInterval(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let dayInterval = TimeInterval(days * 24 * 60 * 60)
        let hourInterval = TimeInterval(hours * 60 * 60)
        let minuteInterval = TimeInterval(minutes * 60)
        return self.addingTimeInterval(dayInterval + hourInterval + minuteInterval)
    }
}

#Preview {
    let now = Date()

    let cases: [(days: Int, hours: Int, minutes: Int, label: String)] = [
        (0, 0, 30,  "30 min reminder"),
        (1, 0, 0,   "Tomorrow"),
        (7, 0, 0,   "Next week"),
        (0, 3, 45,  "3h 45m from now"),
        (2, 12, 15, "2d 12h 15m from now")
    ]

    return List(cases, id: \.label) { c in
        VStack(alignment: .leading, spacing: 4) {
            Text(c.label)
                .font(.headline)
            Text("Input → days:\(c.days)  hours:\(c.hours)  mins:\(c.minutes)")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(now.addingTimeInterval(days: c.days, hours: c.hours, minutes: c.minutes),
                 style: .date)
            + Text("  ")
            + Text(now.addingTimeInterval(days: c.days, hours: c.hours, minutes: c.minutes),
                   style: .time)
        }
        .padding(.vertical, 4)
    }
}
