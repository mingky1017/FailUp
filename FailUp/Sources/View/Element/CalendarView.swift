//
//  CalendarView.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    var body: some View {
        DatePicker(
            "Start Date",
            selection: $date,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
    }
}
#Preview {
    CalendarView()
}
