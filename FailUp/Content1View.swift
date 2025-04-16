//
//  ContentView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//
import SwiftUI

struct Content1View: View {
    @State private var inputText: String = "" // 입력값 저장
    @State private var kg: Int = 0            // kg 값 저장
    
    
    var body: some View {
        NavigationStack {
            VStack {
                // 1. 메인 텍스트 뷰
                MainTextView(kg: kg)
                    .padding(.bottom, 30)
                // 2. Lottie 이미지
                LottieView(filename: "muscles")
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 30)
                // 3. 텍스트 입력 창
                FailTextFieldView(inputText: $inputText, kg: $kg)
                // 4. 지난 기록 보기
                PastRecordView()
                    .padding(.bottom, 30)
                VStack {
                    Text("오늘의 실패 근육은 내일의 용기 근육")
                        .font(.callout)
                        .fontWeight(.regular)
                    Text("실패가 아니라 도전이다")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .font(.system(size: 16))
                .foregroundColor(Color(red: 0.431, green: 0.341, blue: 0.055)) // 6E570E
            }
            .padding(.horizontal, 5)
            
        }
    }
}
#Preview {
    Content1View()
}
