// 파일의 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  ContentView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.

// SwiftUI 프레임워크(애플의 최신 UI 프레임워크)를 사용
import SwiftUI


// 키보드 내리기 기능 (iOS에서만 동작)
// 이 코드는 iOS에서만 동작함,  SwiftUI는 기본적으로 키보드를 내리는 기능이 없음.
// UIKit의 기능을 빌려서 `hideKeyboard()`라는 커스텀 함수를 만들어 줌.
// 이 함수는 화면을 탭할 때 키보드를 내리게 해줌.
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

// MainView 구조체 선언 (MainView는 앱의 메인 화면을 담당하는 SwiftUI 뷰)
// `failData`는 도전/실패 기록 데이터를 담고 있는 객체
// `ObservedObject`는 이 데이터가 바뀌면 화면도 자동으로 업데이트되도록 해 줌.
// `.shared`는 싱글톤 패턴으로, 앱 전체에서 하나만 사용하는 데이터라는 의미.
// `@State private var inputText: String = ""`
// 사용자가 무언가 입력할 때(예: 실패 기록) 임시로 저장하는 입력값.
// `@State`는 SwiftUI에서 값이 바뀌면 화면을 다시 그리게 해주는 속성.
// `@`이 붙은 프로퍼티는 SwiftUI의 라이프사이클과 결합되어, 메모리 관리나 상태 복원을 자동으로 처리.

struct MainView: View {
    @ObservedObject var failData = FailData.shared
    @State private var inputText: String = ""

    var body: some View {
        // 화면 이동(네비게이션)을 지원하는 컨테이너, 여러 화면을 쌓아서 이동할 수 있게 해 줌.
        NavigationStack {
            // 세로 방향으로 뷰를 차곡차곡 쌓아 줌.
            VStack {
                // 메인 텍스트 뷰를 보여 줌.
                // `failData.kg` 값을 전달해서, 예를 들면 “실패 근육”의 무게를 보여주는 역할.
                MainTextView(kg: failData.kg)
                // 아래에 30포인트만큼 여백
                    .padding(.bottom, 30)
                
                // 애니메이션 뷰, Lottie라는 JSON 기반 애니메이션 파일
                LottieView(filename: "muscles")
                // `"muscles"`라는 파일 이름의 애니메이션을 300x300 크기 보여 줌.
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 30)
                
                // 실패 기록 입력란, `failData`와 입력값 바인딩(`$inputText`)을 전달
                // 사용자가 텍스트를 입력하고, 기록을 추가하는 역할
                FailTextFieldView(failData: failData, inputText: $inputText)
                
                // 이전 기록 요약을 보여주는 뷰
                PastRecordView()
                // 아래쪽에 30포인트 여백
                    .padding(.bottom, 30)
                
                // 세로 방향으로 뷰를 차곡차곡 쌓아 줌.
                // 동기부여 문구 두 줄을 보여 줌, 글씨 크기와 색상을 지정
                VStack {
                    Text("오늘의 실패 근육은 내일의 용기 근육")
                        .font(.callout)
                        .fontWeight(.regular)
                    Text("실패가 아니라 도전이다")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .font(.system(size: 16))
                .foregroundColor(Color(red: 0.431, green: 0.341, blue: 0.055))
            }
            .padding(.horizontal, 5)
            // 화면의 빈 곳을 탭하면 키보드가 내려가게 해 줌.
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}
// Xcode의 미리보기 기능을 위한 코드
#Preview {
    MainView()
}
