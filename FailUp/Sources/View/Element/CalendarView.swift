//
//  CalendarView.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import SwiftUI

// CalendarView.swift
struct CalendarView: View {
    @Binding var selectedDate: Date // @Binding 추가

    var body: some View {
        DatePicker(
            "Start Date",
            selection: $selectedDate,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
    }
}

// 프리뷰 수정
#Preview {
    CalendarView(selectedDate: .constant(Date())) // 프리뷰에 파라미터 추가
}

