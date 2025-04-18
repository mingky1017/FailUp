//
//  EditCompletedView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

struct EditCompletedView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var inputText: String = ""
    @State private var isClicked: Bool = false // 버튼 클릭 상태

//    struct EditCompletedView: View {
//        @Binding var isEditCompleted: Bool
//
//        var body: some View {
//            if isEditCompleted {
//                MainView()
//            } else {
//                EditCompletedView(isEditCompleted: $isEditCompleted)
//            }
//        }
//    }
    var body: some View {
        VStack {
            Button(action: {
                isClicked = true
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
        // 여기가 핵심!
//        .navigationDestination(isPresented: $isClicked) {
//            MainView()
//        }
    }
}
//#Preview {
//    EditCompletedView()
//}
