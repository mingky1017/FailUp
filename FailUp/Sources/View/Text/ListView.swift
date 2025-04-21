//
//  ListView.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import SwiftUI

struct FailListView: View {
    @ObservedObject var failData = FailData.shared

    var body: some View {
        if failData.fails.isEmpty {
            VStack {
                Spacer()
                Text("작성된 도전 기록이 없습니다")
                    .foregroundColor(.gray)
                    .font(.title3)
                    .padding()
                Spacer()
            }
        } else {
            List {
                ForEach(failData.fails) { fail in
                    NavigationLink(destination: ChallengeRecordEditView(failItem: bindingForFail(fail))) {
                        Text(fail.text)
                            .font(.system(size: 15))
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            if let index = failData.fails.firstIndex(where: { $0.id == fail.id }) {
                                failData.removeFail(at: IndexSet(integer: index))
                            }
                        } label: {
                            Label("삭제", systemImage: "trash")
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }

    // 바인딩 생성 함수
    func bindingForFail(_ fail: FailItem) -> Binding<FailItem> {
        guard let index = failData.fails.firstIndex(where: { $0.id == fail.id }) else {
            fatalError("Fail not found")
        }
        return $failData.fails[index]
    }
}
#Preview {
    NavigationStack {
        FailListView()
    }
}

