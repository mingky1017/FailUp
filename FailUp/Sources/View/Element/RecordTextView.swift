// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  RecordTextView.swift
//  FailUp
//
//  Created by 윤민경 on 4/18/25.
//
//
//  ChallengeRecordView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

// RecordTextView 구조체 선언
// “수정 하기” 화면의 커스텀 네비게이션 바를 담당하는 SwiftUI 뷰
struct RecordTextView: View {
    
    // SwiftUI의 환경에서 “이 화면을 닫는 기능”을 가져 옴
    // `dismiss()`를 호출하면 현재 화면이 닫힘
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        // 화면 이동(네비게이션)을 지원하는 컨테이너
        NavigationStack {
            // 수평 스택
                HStack {
                    // 뒤로 가기 버튼
                    // 버튼을 누르면 `dismiss()`가 호출되어 이 화면이 닫힘
                    Button(action: { dismiss() }) {
                        // 왼쪽 화살표 아이콘을 사용
                        Image(systemName: "chevron.left")
                        // 이콘 크기를 키우기
                            .font(.title2)
                        // 아이콘 색상을 검정으로 지정
                            .foregroundColor(.black)
                    }
                    // 양쪽에 균등하게 배치
                    Spacer()
                    Text("수정 하기")
                    // 화면의 제목을 가운데에 굵게 표시
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    // 오른쪽에 투명한 뷰를 24포인트만큼 넣어 왼쪽의 버튼과 균형을 맞춤
                    // 제목이 항상 “가운데”에 오도록
                    Color.clear.frame(width: 24)
                }
            // 좌우로 기본 여백을 추가
                .padding(.horizontal)
            }
        }
        
    }
// Xcode의 미리보기 기능
#Preview {
    RecordTextView()
}
