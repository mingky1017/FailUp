// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  EditCompletedView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

// EditCompletedView 구조체 선언
struct EditCompletedView: View {
    // 부모 뷰(예: ChallengeRecordEditView)에서 바인딩으로 받아온 실패 기록
    @Binding var failItem: FailItem
    // 화면을 닫는 액션을 환경에서 받아옴, `dismiss()`를 호출하면 현재 화면이 닫힘
    @Environment(\.dismiss) private var dismiss
    // 버튼이 클릭되었는지 여부를 저장하는 상태 변수, 클릭 시 색상 등 UI 변화를 주는 데 사용
    @State private var isClicked: Bool = false

    var body: some View {
        // 세로로 뷰를 쌓는 레이아웃
        VStack {
            // 버튼을 누르면 실행되는 코드를 정의
            Button(action: {
                // 버튼이 눌렸다는 표시로 상태를 true, 이 값에 따라 버튼 배경색이 바뀜
                // 필요하다면 failItem의 값을 여기서 사용 (예: 서버에 저장, 로컬에 반영 등)
                isClicked = true
                // 화면을 닫습니다. (예: 모달, 시트, 네비게이션 등에서 뒤로 가기)
                dismiss()
            }) {
                // 버튼의 디자인
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
            // 버튼의 좌우에 24포인트만큼 여백
            .padding(.horizontal, 24)
        }
    }
}
// Xcode 미리보기
#Preview {
    struct PreviewWrapper: View {
        // 바인딩으로 전달, 실제 앱을 실행하지 않아도, 이 뷰가 어떻게 보일지 실시간으로 확인
        @State var failItem = FailItem(text: "프리뷰 실패")
        var body: some View {
            EditCompletedView(failItem: $failItem)
        }
    }
    return PreviewWrapper()
}
