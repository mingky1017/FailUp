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
    
    // 커스텀 이니셜라이저 (SwiftUI에서 @Binding과 @State를 동시에 초기화할 때 필요한 패턴)
    init(failItem: Binding<FailItem>) {
        // 바인딩을 구조체의 @Binding 변수에 연결
        self._failItem = failItem
        // failItem의 text 값을 inputText의 초기값으로 사용 -> 처음 화면이 그려질 때 failItem.text 값이 inputText에 복사
        _inputText = State(initialValue: failItem.wrappedValue.text)
    }
    
    var body: some View {
        // 수직 스택
        VStack(alignment: .leading, spacing: 4) {
            // 여러 뷰를 겹쳐서 쌓는 레이아웃
            ZStack(alignment: .topLeading) {
                // inputText가 비어 있으면(아무것도 입력 안 했을 때)연한 회색 플레이스홀더 텍스트를 보여줌.
                if inputText.isEmpty {
                    Text("무엇을 했을지 너무 궁금하다...")
                        .foregroundColor(Color(red: 0.768, green: 0.768, blue: 0.78))
                }
                // 텍스트 입력란. 입력값은 inputText와 바인딩.
                TextField("", text: $inputText)
                // inputText가 바뀔 때마다 실행, 최대 20자 입력 제한, failItem.text와 동기화
                    .onChange(of: inputText) {
                        if inputText.count > 20 {
                            inputText = String(inputText.prefix(20))
                        }
                        failItem.text = inputText // ★ failItem.text와 동기화
                    }
            } // 부모 뷰와 데이터가 항상 일치
            .font(.body)
        }// 입력란 좌우에 24포인트 여백
        .padding(.horizontal, 24)
        
        HStack {
            Spacer()
            //  글자 수 카운터
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
