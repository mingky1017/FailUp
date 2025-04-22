// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  MainTextView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//

import SwiftUI

// MainTextView 구조체 선언
struct MainTextView: View {
    // 실패 기록의 “무게”를 나타내는 값, 부모 뷰에서 이 값을 받아서 사용
    var kg: Int
    
    // todayString = 오늘 날짜를 한글로 포맷하는 변수
    var todayString: String {
        // `DateFormatter`를 사용해서 한글(한국) 스타일로 날짜를 포맷
        let formatter = DateFormatter()
        //한국어로 요일 등을 표시
        formatter.locale = Locale(identifier: "ko_KR")
        // 연, 월, 일, 요일 형식
        formatter.dateFormat = "yyyy년 M월 d일 EEEE"
        // 오늘 날짜를 위 형식대로 문자열로 변환
        return formatter.string(from: Date())
    }
        
    var body: some View {
        // 수직 스택
        VStack {
            
            // 오늘 날짜 표시
            Text(todayString)
                .font(.title2)
                .fontWeight(.medium)
            
            // 실패/성공 HStack (가로로 나란히 배치)
            HStack {
                Spacer()
                Text("실패")
                    .fontWeight(.semibold)
                Text("\(kg)kg")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.red)
                Text("성공!")
                    .fontWeight(.semibold)
                Spacer()
            }
            .font(.largeTitle)
            .bold()
            .padding(.top, 2)
            
            // 안내 문구
            Text("오늘의 실패 입력하고 용기 근육 키우자")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .padding(.top, 0.5)
        }
    }
}
// Xcode 미리보기 기능, 실제 앱을 실행하지 않아도 이 뷰가 어떻게 보일지 실시간으로 확인
#Preview {
    MainTextView(
        kg: 0
    )
}
