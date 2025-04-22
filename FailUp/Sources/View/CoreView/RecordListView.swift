// 파일 정보와 SwiftUI 프레임워크를 불러오는 부분
//  RecordView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//

import SwiftUI

// RecordListView라는 이름의 화면(뷰)
// SwiftUI에서 모든 화면은 `View` 프로토콜을 채택해야 함.
struct RecordListView: View {
    // 상태 변수, 사용자가 캘린더에서 날짜를 선택하면 이 값이 바뀌고, 화면이 자동으로 업데이트.
    // `Date()`는 오늘 날짜로 초기화
    @State private var selectedDate = Date()

    var body: some View {
        
        // 수직 스택. 안에 들어있는 뷰들을 위에서 아래로 쌓는 역할.
        VStack {
            
            // 얇은 선을 그려주는 뷰
            Divider()
            // 선의 두께를 0.33포인트로 아주 얇게 설정.
                .frame(height: 0.33)
            
            // 캘린더 뷰, 사용자가 날짜를 선택 가능
            // 바인딩(Binding) `$`를 붙이면, 값 자체가 아니라 “값을 읽고 쓸 수 있는 연결고리”를 전달
            // CalendarView에서 날짜를 선택하면, `selectedDate` 값이 자동으로 바뀜.
            CalendarView(selectedDate: $selectedDate)
            
            // 다시 한 번 얇은 선을 그려서 캘린더와 기록 리스트를 구분
            Divider()
                .frame(height: 0.33)
            
            // 실패 기록 리스트 뷰, 위에서 선택된 날짜를 전달
            // FailListView는 이 날짜에 해당하는 기록만 보여줌
            FailListView(selectedDate: selectedDate)
            
            //두 줄의 응원 메시지
            Text("실패해도 괜찮아, 잘하고 있어!")
                .font(.system(size: 12))
                .fontWeight(.regular)
                .foregroundColor(Color(red: 0.753, green: 0.757, blue: 0.769)) // #C0C1C4
            Text("실패는 새로운 경험의 시작이야!")
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.753, green: 0.757, blue: 0.769)) // #C0C1C4
        }
        // 상단 네비게이션 바에 “나의 도전 기록”이라는 제목을 표시
        .navigationTitle("나의 도전 기록")
        // `.inline`은 제목을 작게, 한 줄로 표시
        .navigationBarTitleDisplayMode(.inline)
    }
}
// Xcode의 미리보기 기능입니다.
//`NavigationStack` 안에 `RecordListView`를 넣음.
// 실제 앱에서처럼 네비게이션 바가 보이게 미리 볼 수 있음.
#Preview {
    NavigationStack {
        RecordListView()
    }
}
