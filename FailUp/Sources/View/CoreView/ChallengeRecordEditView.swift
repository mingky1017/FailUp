// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  Content2View.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

// ChallengeRecordEditView 구조체 선언
// ChallengeRecordEditView는 “도전 기록을 수정하는 화면”
struct ChallengeRecordEditView: View {
    
    // 바인딩 변수
    // 부모 뷰(예: FailListView)에서 수정할 기록(failItem)을 바인딩으로 받아 옴.
    //  바인딩이므로, 이 화면에서 failItem을 수정하면 부모 뷰의 failItem도 동시에 바뀜.
    //  즉, 원본 데이터를 직접 연결해서 실시간으로 수정할 수 있습니다.
    @Binding var failItem: FailItem
    
    // body: 화면의 실제 모습
    var body: some View {
        // 수직 스택
        VStack {
        
            //아주 얇은 구분선
            Divider()
                .frame(height: 0.33)
            
            // 기록을 입력,수정하는 입력란
            // failItem을 바인딩으로 전달
            // WriteView에서 failItem의 내용을 바꾸면, ChallengeRecordEditView와 부모 뷰에도 즉시 반영
            WriteView(failItem: $failItem)
            
            //WriteView 주변에 기본 여백을 추가
                .padding()
            
            // “수정 완료”와 관련된 UI
            // 역시 failItem을 바인딩으로 전달하여, 이 뷰에서도 failItem을 직접 수정 가능
            EditCompletedView(failItem: $failItem)
            
            //주변에 기본 여백을 추가
                .padding()
        }
        // “수정 하기”라는 제목을 표시
        .navigationTitle("수정 하기")
        // 제목을 작게, 한 줄로 표시
        .navigationBarTitleDisplayMode(.inline)
    }
}

//Xcode의 미리보기 기능
#Preview {
    // `@State var failItem`을 만들어서, 바인딩으로 ChallengeRecordEditView에 전달
    // 실제 앱을 실행하지 않아도, 이 뷰가 어떻게 보일지 실시간으로 확인 가능
    @Previewable @State var failItem: FailItem = FailItem(text: "")
    ChallengeRecordEditView(failItem: $failItem)
}
