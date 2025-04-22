// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  ChallengeRecordView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

// ChallengeRecordView 구조체 선언
// ChallengeRecordView는 “나의 도전 기록” 화면을 담당하는 SwiftUI 뷰
struct ChallengeRecordView: View {
    
    // @Environment는 SwiftUI에서 “앱 환경”에 있는 특별한 값을 가져오는 방법
    // \.dismiss`는 “현재 화면을 닫는 함수,
    // 즉, `dismiss()`를 호출하면 이 화면이 닫히고, 이전 화면으로 돌아감.
    @Environment(\.dismiss) var dismiss
    
    // body: 화면의 실제 모습
    var body: some View {
        
        // SwiftUI의 화면 이동(네비게이션)을 지원하는 컨테이너
        NavigationStack {
            
            // 수직 스택. 안에 들어있는 뷰들을 위에서 아래로 쌓습니다.
            // 뷰 사이의 간격을 0
            VStack(spacing: 0) {
                
                // 수평 스택. 안에 들어있는 뷰들을 왼쪽에서 오른쪽으로 나란히 배치
                HStack {
                    
                    // 뒤로 가기 버튼
                    // 버튼을 누르면 `dismiss()`가 호출되어 이 화면이 닫힘.
                    Button(action: { dismiss() }) {
                        // 왼쪽 화살표 아이콘을 사용
                        Image(systemName: "chevron.left")
                        // 아이콘 크기 키우기
                            .font(.title2)
                        // 아이콘 색상을 검정으로 지정
                            .foregroundColor(.black)
                    }
                    // 남은 공간을 채워서, 아이콘과 텍스트, 빈 공간이 양쪽에 균등하게 배치
                    Spacer()
                    
                    Text("나의 도전 기록")
                    // 화면의 제목을 가운데에 굵게 표시
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    // 오른쪽에 투명한(보이지 않는) 뷰를 24포인트만큼 넣어 왼쪽의 버튼과 균형을 맞춥
                    // 버튼이 없는 오른쪽도 같은 크기의 공간을 확보해서 제목이 항상 “가운데”에 오도록
                    Color.clear.frame(width: 24)
                }
                //좌우로 기본 여백을 추가
                .padding(.horizontal)
            }
        }
        
    }
}
// Xcode의 미리보기 기능
#Preview {
    ChallengeRecordView()
}
