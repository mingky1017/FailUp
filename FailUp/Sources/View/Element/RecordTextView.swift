//
//  RecordTextView.swift
//  FailUp
//
//  Created by 윤민경 on 4/18/25.
//
//
//  ChallengeRecordView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

struct RecordTextView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // 커스텀 네비게이션 바
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text("수정 하기")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    Color.clear.frame(width: 24)
                }
                .padding(.horizontal)
            }
        }
        
    }
}
#Preview {
    RecordTextView()
}
