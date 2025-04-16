//
//  EditCompletedView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

struct EditCompletedView: View {
    @State private var inputText: String = ""
    @State private var isClicked: Bool = false // 버튼 클릭 상태
    
    var body: some View {
        Button(action: {
            // 수정 완료 동작
            isClicked = true // 클릭 시 true로 변경
        }) {
            Text("수정 완료")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(isClicked
                            ? Color.black // 클릭하면 검정색
                            : Color(red: 0.431, green: 0.431, blue: 0.431)) // 평소에는 6E6E6E
                .cornerRadius(12)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }
}

#Preview {
    EditCompletedView()
}

