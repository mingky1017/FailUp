// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  ListView.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import SwiftUI

// FailListView 구조체 선언
//  “실패 기록 리스트”를 보여주는 SwiftUI 뷰
struct FailListView: View {
    // 실패 기록 데이터 모델(FailData)을 관찰
    // FailData가 바뀌면 이 뷰도 자동으로 업데이트
    // `.shared`는 싱글톤 패턴으로, 앱 전체에서 하나만 사용하는 데이터임을 의미
    @ObservedObject var failData = FailData.shared
    
    // 부모 뷰(예: RecordListView)에서 선택한 날짜를 받아 옴.
    // 이 날짜에 해당하는 기록만 보여 줌.
    var selectedDate: Date // 추가
    
    var body: some View {
        // 날짜별로 기록 필터링
        // 각 실패 기록의 날짜($0.date)가 selectedDate와 같은 날인 것만 골라 냄.
        // 즉, 오늘을 선택하면 오늘의 기록만,어제면 어제의 기록만 보여 줌.
        let filteredFails = failData.fails.filter {
            Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
        }

        // 기록이 없을 때
        // “작성된 도전 기록이 없습니다”라는 안내 메시지를 화면 중앙에 보여 줌.
        if filteredFails.isEmpty {
            VStack {
                Spacer()
                Text("작성된 도전 기록이 없습니다")
                    .foregroundColor(.gray)
                    .font(.title3)
                    .padding()
                Spacer()
            }
            
        // 기록이 있을 때, 기록이 있으면, List로 각 기록을 한 줄씩 보여 줌.
        } else {
            List {
                // filteredFails 배열의 각 실패 기록을 반복해서 보여 줌.
                ForEach(filteredFails) { fail in
                    // 각 기록을 누르면 ChallengeRecordEditView로 이동해서 해당 기록을 수정
                    // 해당 기록의 바인딩을 만들어서 넘겨줍
                    NavigationLink(destination: ChallengeRecordEditView(failItem: bindingForFail(fail))) {
                        Text(fail.text)
                            .font(.system(size: 15))
                    }
                    // 각 기록을 왼쪽으로 밀면(스와이프) “삭제” 버튼 나타남
                    // “삭제”를 누르면 해당 기록이 삭제
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
            // 리스트의 스타일을 기본(Plain)으로 지정
            .listStyle(.plain)
        }
    }

    // bindingForFail 함수, 특정 실패 기록(fail)의 바인딩(Binding)을 만들어서 반환
    // ChallengeRecordEditView에서 해당 기록을 직접 수정
    func bindingForFail(_ fail: FailItem) -> Binding<FailItem> {
        guard let index = failData.fails.firstIndex(where: { $0.id == fail.id }) else {
            fatalError("Fail not found")
        }
        return $failData.fails[index]
    }
}
// Xcode 미리보기 기능
// NavigationStack 안에 FailListView를 넣어서, 실제 앱에서처럼 네비게이션 기능이 정상적으로 동작하는지 확인
#Preview {
    NavigationStack {
        FailListView(selectedDate: Date())
    }
}
