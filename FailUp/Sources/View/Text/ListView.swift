//
//  ListView.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import SwiftUI

struct FailListView: View {
    @ObservedObject var failData = FailData.shared
    var selectedDate: Date // 추가
    
    var body: some View {
        // 1. 선택된 날짜와 같은 날의 기록만 필터링
        let filteredFails = failData.fails.filter {
            Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
        }

        // 2. 필터링된 배열로 표시
        if filteredFails.isEmpty {
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
                ForEach(filteredFails) { fail in
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
        FailListView(selectedDate: Date())
    }
}
