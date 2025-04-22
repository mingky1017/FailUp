// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  FailTextFieldView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//
import SwiftUI

// FailTextFieldView 구조체 선언
// “실패 기록 입력란”을 담당하는 SwiftUI 뷰
struct FailTextFieldView: View {
    
    // 실패 기록 데이터를 관리하는 데이터 모델(FailData)을 관찰
    // FailData가 바뀌면 이 뷰도 자동으로 업데이트
    @ObservedObject var failData: FailData
    
    // 부모 뷰에서 입력값을 바인딩으로 받아 옴.
    // 이 뷰에서 inputText를 바꾸면 부모 뷰의 값도 같이 바뀜
    @Binding var inputText: String
    
    // “작성이 끝났나요?” 알림(Alert) 창을 띄울지 여부를 저장하는 상태 변수
    @State private var showAlert = false

    var body: some View {
        
        // 수평 스택, 입력란(TextField)과 전송 버튼(이미지)을 가로로 배치
        HStack {
            
            // “오늘의 실패 입력하기”라는 플레이스홀더가 있는 입력란
            // 입력값은 바인딩($inputText)으로 부모 뷰와 실시간 동기화
            TextField("오늘의 실패 입력하기", text: $inputText)
            
            // inputText가 바뀔 때마다 실행
            // 글자 수가 20자를 넘으면 자동으로 20자로 잘라 줌.
                .onChange(of: inputText) {
                    if inputText.count > 20 {
                        inputText = String(inputText.prefix(20))
                    }
                }
            
            // 입력란 글씨 크기를 16포인트로 지정
                .font(.system(size: 16))
            
            // “전송”을 상징하는 동그라미 속 화살표 아이콘
            Image(systemName: "arrow.up.circle.fill")
                .resizable()
            // 아이콘 크기를 24x24로 지정
                .frame(width: 24, height: 24)
            // 입력값이 없으면 아이콘이 회색, 입력값이 있으면 파란색으로 표시
                .foregroundColor(inputText.isEmpty ? .gray : .blue)
            // 오른쪽에 4포인트 여백
                .padding(.trailing, 4)
            // 아이콘을 탭하면 실행
            // 입력값이 비어 있지 않으면(showAlert = true) → 알림(Alert) 창 띄움
                .onTapGesture {
                    if !inputText.isEmpty {
                        showAlert = true
                    }
                }
        }
        // 입력란 위아래 15, 좌우 12포인트 여백
        .padding(.vertical, 15)
        .padding(.horizontal, 12)
        
        // 밝은 회색 배경을 적용
        .background(Color(.systemGray6))
        
        // 모서리를 둥글게(10포인트)
        .cornerRadius(10)
        
        // 전체 입력란을 화면 양쪽에서 24포인트
        .padding(.horizontal, 24)
        
        // showAlert가 true가 되면 “작성이 끝났나요?“라는 알림(Alert) 창 띄움
        .alert("작성이 끝났나요?", isPresented: $showAlert) {
            // `"취소"`(빨간색, .destructive): 아무 동작 없음(닫기만 함)
            Button("취소", role: .cancel) { }
            // "완료"`(파란색, .cancel): failData에 새로운 실패 기록을 추가
            Button("완료", role: .none) {
                failData.addFail(text: inputText, date: Date())
                // 입력란을 비움(inputText = “”)
                inputText = ""
            } // 파란색
        } message: {
            // 알림창에 응원 메시지를 추가
            Text("실패를 기록한 당신, 너무 멋있어요! 💪")
        }
    }
}
// Xcode 미리보기 기능, Xcode 15부터 도입된 새로운 프리뷰 문법
#Preview {
    
    // 프리뷰 전용의 임시 부모 뷰
    // FailTextFieldView에 바인딩(@Binding)을 넘기려면 부모가 @State로 값을 갖고 있어야 하기 때문
    struct PreviewWrapper: View {
        
        // @State로 inputText를 만들어 바인딩으로 전달
        // PreviewWrapper 내부에 inputText라는 상태 변수
        // 이 값이 실제 데이터의 “소유자”가 됨
        @State var inputText = ""
        
        var body: some View {
            // FailTextFieldView에 inputText의 바인딩($inputText)을 전달
            // FailTextFieldView에서 inputText를 바꾸면, PreviewWrapper의 inputText도 같이 바뀜.
            FailTextFieldView(
                failData: FailData.shared,
                inputText: $inputText
            )
        }
    }
    // 프리뷰에서 임시 부모 뷰 보여주기
    return PreviewWrapper()
}
