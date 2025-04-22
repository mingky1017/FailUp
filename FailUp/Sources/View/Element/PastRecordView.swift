// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  PastRecordView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//

import SwiftUI

// PastRecordView 구조체 선언
struct PastRecordView: View {
    var body: some View {
        // 세로로 뷰를 쌓는 레이아웃
        VStack {
            // SwiftUI에서 “다른 화면으로 이동하는 버튼”
            // 이 버튼을 누르면 `"RecordListView"`라는 값을 네비게이션 스택에 전달
            // 이 값은 아래의 `.navigationDestination(for:)`에서 사용
            NavigationLink(value: "RecordListView") {
                // 버튼 디자인
                Text("지난 기록 보기")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(red: 0.431, green: 0.431, blue: 0.431))
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color(red: 0.898, green: 0.898, blue: 0.898))
                    .cornerRadius(12)
            }
            // NavigationStack에서 value 타입이 String일 때 어떤 화면으로 이동할지 지정
            // value가 `"RecordListView"`일 때, RecordListView() 화면으로 이동
            .navigationDestination(for: String.self) { value in
                RecordListView()
            }
            // 좌우에 24포인트만큼 여백
            .padding(.horizontal, 24)
        }
    }
}
// Xcode 미리보기
// NavigationStack 안에 PastRecordView를 넣어서, 실제 앱에서처럼 네비게이션 기능이 정상적으로 동작하는지 확인
struct PastRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PastRecordView()
        }
    }
}
