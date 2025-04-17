//
//  PastRecordView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//

import SwiftUI

struct PastRecordView: View {
    var body: some View {
            VStack {
                // 지난 기록 보기 버튼
                NavigationLink(destination: RecordListView()) {
                    Text("지난 기록 보기")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(red: 0.431, green: 0.431, blue: 0.431))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color(red: 0.898, green: 0.898, blue: 0.898))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 24)
            }
        }
    }
#Preview {
    PastRecordView()
}
