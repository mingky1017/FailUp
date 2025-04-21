//
//  FailTextFieldView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//
import SwiftUI

struct FailTextFieldView: View {
    @ObservedObject var failData: FailData
    @Binding var inputText: String
    @Binding var kg: Int
    var onCommit: (String) -> Void = { text in
        var failData: FailData = .shared
        failData.fails.append(
            FailItem(text: text, date: Date())
        )
    }
    @State private var showAlert = false // 1. alert 상태 변수 추가

    var body: some View {
        HStack {
            HStack {
                TextField("오늘의 실패 입력하기", text: $inputText)
                    .onChange(of: inputText) {
                        if inputText.count > 20 {
                            inputText = String(inputText.prefix(20))
                        }
                    }
                    .font(.system(size: 16))
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(inputText.isEmpty ? .gray : .blue)
                    .padding(.trailing, 4)
                    .onTapGesture {
                        if !inputText.isEmpty {
                            showAlert = true // 2. 바로 실행하지 않고 alert 표시
                        }
                    }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        .padding(.horizontal, 24)
        // 3. alert 모디파이어 추가
        .alert("작성히 끝났나요?", isPresented: $showAlert) {
            Button("취소", role: .cancel) { }
            Button("완료", role: .destructive) {
                // 4. 완료 버튼에서만 실제 동작 실행
                onCommit(inputText)
                kg += 10
                inputText = ""
            }
        } message: {
            Text("실패를 기록한 당신, 너무 멋있어요! 💪")
        }
    }
}
#Preview {
    FailTextFieldView(
        failData: FailData.shared,
        inputText: .constant(""),
        kg: .constant(0)
    )
}
