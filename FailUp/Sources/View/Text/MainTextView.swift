//
//  MainTextView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//

import SwiftUI

struct MainTextView: View {
    var kg: Int           // kg 값 저장
    
    // 오늘 날짜를 한글로 포맷하는 변수
    var todayString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일 EEEE"
        return formatter.string(from: Date())
    }
        
    var body: some View {
        VStack {
            
            // 텍스트는 화면 위쪽에 고정
            // 날짜 (자동으로 오늘 날짜 표시)
            Text(todayString)
                .font(.title2)
                .fontWeight(.medium)
            // 실패/성공 HStack
            HStack {
                Spacer()
                Text("실패")
                    .fontWeight(.semibold)
                Text("\(FailData.shared.kg)kg")
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

#Preview {
    MainTextView(
        kg: 0
    )
}
