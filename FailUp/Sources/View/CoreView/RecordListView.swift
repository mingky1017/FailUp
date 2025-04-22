//
//  RecordView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//

import SwiftUI

struct RecordListView: View {
    @State private var selectedDate = Date() // 기본값: 오늘

    var body: some View {
        VStack {
            Divider()
                .frame(height: 0.33)
            CalendarView(selectedDate: $selectedDate) // 바인딩 전달
            Divider()
                .frame(height: 0.33)
            FailListView(selectedDate: selectedDate) // 선택된 날짜 전달
            Text("실패해도 괜찮아, 잘하고 있어!")
                .font(.system(size: 12))
                .fontWeight(.regular)
                .foregroundColor(Color(red: 0.753, green: 0.757, blue: 0.769)) // #C0C1C4
            Text("실패는 새로운 경험의 시작이야!")
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.753, green: 0.757, blue: 0.769)) // #C0C1C4
        }
        .navigationTitle("나의 도전 기록")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    NavigationStack {
        RecordListView()
    }
}
