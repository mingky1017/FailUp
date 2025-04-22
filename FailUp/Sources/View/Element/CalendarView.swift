// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  CalendarView.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import SwiftUI

// CalendarView 구조체 선언
struct CalendarView: View {
    
    // 바인딩 변수
    // 부모 뷰(예: RecordListView)에서 관리하는 날짜 상태(selectedDate)를 바인딩으로 받아 옴.
    // 이 화면에서 날짜를 바꾸면 부모 뷰의 selectedDate도 동시에 바뀜.
    // 즉, 원본 데이터를 직접 연결해서 실시간으로 수정할 수 있음.
    @Binding var selectedDate: Date
    
    var body: some View {
        // DatePicker는 날짜를 선택할 수 있는 UI 컴포넌트
        DatePicker(
            // "Start Date"`는 접근성(VoiceOver 등)에서 읽어주는 레이블.
            // 실제 화면에는 보이지 않을 수 있음.
            "Start Date",
            
            // 바인딩으로 전달된 selectedDate를 사용.
            // 사용자가 DatePicker에서 날짜를 바꾸면, selectedDate 값이 즉시 변경.
            // 부모 뷰의 selectedDate도 동시에 바뀌어서, 연동된 모든 뷰가 업데이트
            selection: $selectedDate,
            
            // 날짜만(연-월-일) 선택할 수 있게, 시간 선택은 불가
            displayedComponents: [.date]
        )
        // 그래픽 스타일로 DatePicker를 표시, iOS 14 이상에서 지원됨
        .datePickerStyle(.graphical)
    }
}

// Xcode의 미리보기 기능
// 프리뷰에서는 실제 바인딩이 없으므로, `.constant(Date())`로 변경 불가한 임시 값을 전달
// 실제 앱에서는 부모 뷰의 `@State` 변수를 바인딩으로 받음.
#Preview {
    CalendarView(selectedDate: .constant(Date()))
}

