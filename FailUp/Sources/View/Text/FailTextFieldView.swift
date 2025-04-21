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
    @State private var showAlert = false

    var body: some View {
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
                        showAlert = true
                    }
                }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 12)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal, 24)
        .alert("작성이 끝났나요?", isPresented: $showAlert) {
            Button("취소", role: .cancel) { }
            Button("완료", role: .destructive) {
                failData.addFail(text: inputText, date: Date())
                inputText = ""
            }
        } message: {
            Text("실패를 기록한 당신, 너무 멋있어요! 💪")
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var inputText = ""
        var body: some View {
            FailTextFieldView(
                failData: FailData.shared,
                inputText: $inputText
            )
        }
    }
    return PreviewWrapper()
}
