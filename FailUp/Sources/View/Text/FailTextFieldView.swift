//
//  FailTextFieldView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//

import SwiftUI

struct FailTextFieldView: View {
    @Binding var inputText: String
    @Binding var kg: Int
    var onCommit: (String) -> Void = { text in
        var failData: FailData = .shared
        failData.fails.append(
            FailItem(text: text, date: Date())
        )
    }
    
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
                            onCommit(inputText)
                            kg += 10
                            inputText = ""
                        }
                    }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    FailTextFieldView(
        inputText: .constant(""), kg: .constant(0)
    )
}
