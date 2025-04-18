//
//  ListView.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import SwiftUI

struct FailListView: View {
    @State var fails: [FailItem] = FailData.shared.fails

    var body: some View {
        List {
            ForEach($fails) { fail in
                NavigationLink(destination: ChallengeRecordEditView(failItem: fail)) {
                    Text(fail.wrappedValue.text)
                        .font(.system(size: 15))
                }
                .swipeActions {
                    Button(role: .destructive) {
                        // 삭제 동작
                        if let index = fails.firstIndex(where: { $0.id == fail.wrappedValue.id }) {
                            fails.remove(at: index)
                        }
                    } label: {
                        Label("삭제", systemImage: "trash") // "trash" SF 심볼
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        FailListView()
    }
}

