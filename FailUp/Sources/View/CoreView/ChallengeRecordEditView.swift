//
//  Content2View.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

struct ChallengeRecordEditView: View {
    @Binding var failItem: FailItem
    
    var body: some View {
        // 0. 상단 제목
        NavigationStack {
            
            VStack {
                // 1. 선
                Divider()
                    .frame(height: 0.33)
                // 2. 작성
                WriteView(failItem: $failItem)
                    .padding()
                // 3. 수정 완료 버튼
                EditCompletedView()
                    .padding()
            }
            
            .navigationTitle("나의 도전 기록")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChallengeRecordEditView_Previews: PreviewProvider {
    @State static var failItem: FailItem = FailData.shared.fails[0]
    
    static var previews: some View {
        ChallengeRecordEditView(failItem: $failItem)
    }
}
