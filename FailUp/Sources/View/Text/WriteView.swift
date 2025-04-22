// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  RetouchView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//
import SwiftUI

// WriteView 구조체 선언 및 변수, 실패 기록을 입력/수정하는 입력란”을 담당하는 SwiftUI 뷰
struct WriteView: View {
    // 부모 뷰(예: ChallengeRecordEditView)에서 바인딩으로 받아온 실패 기록
    @Binding var failItem: FailItem
    // 텍스트필드에 입력되는 값을 저장하는 상태 변수
    // 용자가 입력할 때마다 값이 바뀌고, 화면도 자동으로 업데이트
    @State private var inputText: String
    
    // 커스텀 이니셜라이저
    init(failItem: Binding<FailItem>) {
        self._failItem = failItem
        _inputText = State(initialValue: failItem.wrappedValue.text)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .topLeading) {
                if inputText.isEmpty {
                    Text("무엇을 했을지 너무 궁금하다...")
                        .foregroundColor(Color(red: 0.768, green: 0.768, blue: 0.78))
                }
                TextField("", text: $inputText)
                    .onChange(of: inputText) {
                        if inputText.count > 20 {
                            inputText = String(inputText.prefix(20))
                        }
                        failItem.text = inputText // ★ failItem.text와 동기화
                    }
            }
            .font(.body)
        }
        .padding(.horizontal, 24)
        
        HStack {
            Spacer()
            Text("(\(inputText.count)/20)")
                .font(.caption)
                .foregroundColor(Color(red: 0.768, green: 0.768, blue: 0.78))
                .padding(.trailing, 32)
        }
        Spacer()
    }
}
//struct WriteView_Previews: PreviewProvider {
//    @State static var failItem: FailItem = FailData.shared.fails[0]
//
//    static var previews: some View {
//        WriteView(failItem: $failItem)
//    }
//}
