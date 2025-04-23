// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  FailUpApp.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//

//  SwiftData: (주석 처리된 코드에서 사용) Swift의 데이터 영속성 프레임워크
import SwiftUI
import SwiftData

// 이 구조체가 앱의 진입점(시작점)임, SwiftUI 앱에서는 반드시 하나의 @main 구조체만 존재해야 함.
@main
// SwiftUI 앱의 최상위 구조체
// 프로토콜을 채택하면 앱의 생명주기와 초기 화면을 정의할 수 있른.
struct FailUpApp: App {
    // 앱의 씬(화면 그룹)*을 정의
    // iOS에서는 주로 하나의 `WindowGroup`만 사용
    var body: some Scene {
        
        //앱의 “창 그룹”
        WindowGroup {
            // 앱 실행 시 가장 먼저 보여줄 SwiftUI 뷰
            MainView()
        }
    }
}
