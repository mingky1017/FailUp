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
        VStack {
            Divider()
                .frame(height: 0.33)
            WriteView(failItem: $failItem)
                .padding()
            EditCompletedView(failItem: $failItem)
                .padding()
        }
        .navigationTitle("수정 하기")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    struct PreviewWrapper: View {
        @State var failItem: FailItem = FailData.shared.fails[0]
        var body: some View {
            ChallengeRecordEditView(failItem: $failItem)
        }
    }
    return NavigationStack {
        PreviewWrapper()
    }
}
