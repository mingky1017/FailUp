//
//  EditCompletedView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

struct EditCompletedView: View {
    @Binding var failItem: FailItem
    @Environment(\.dismiss) private var dismiss
    @State private var isClicked: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                isClicked = true
                // failItem을 여기서 활용
                dismiss()
            }) {
                Text("수정 완료")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(isClicked
                                ? Color.black
                                : Color(red: 0.431, green: 0.431, blue: 0.431))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 24)
        }
    }
}
#Preview {
    struct PreviewWrapper: View {
        @State var failItem = FailItem(text: "프리뷰 실패")
        var body: some View {
            EditCompletedView(failItem: $failItem)
        }
    }
    return PreviewWrapper()
}
