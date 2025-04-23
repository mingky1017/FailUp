// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  LottieView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//
// iOS 앱의 최신 UI 프레임워크
import SwiftUI
// SON 기반 애니메이션을 보여주는 오픈소스 라이브러리 (Airbnb에서 개발)
import Lottie

// LottieView 구조체 선언, SwiftUI에서 Lottie 애니메이션을 쉽게 보여주기 위한 “브릿지” 뷰
// UIKit의 UIView(Lottie 애니메이션 뷰)**를 SwiftUI에서 사용
// 보여줄 Lottie 애니메이션 파일의 이름
struct LottieView: UIViewRepresentable {

    // 애니메이션 반복 방식 (기본값: 무한 반복)
    var filename: String
    
    var loopMode: LottieLoopMode = .loop
    
// SwiftUI가 이 뷰를 처음 만들 때 호출하는 함수
    func makeUIView(context: Context) -> UIView {
        // 기본 UIView(컨테이너)를 만듭니다.
        let view = UIView(frame: .zero)
        // Lottie 애니메이션 뷰를 생성, 지정한 파일을 로드
        let animationView = LottieAnimationView(name: filename)
        // 애니메이션이 뷰 크기에 맞게 비율 유지하며 표시
        animationView.contentMode = .scaleAspectFit
        // 애니메이션 반복 방식 지정 (기본은 .loop)
        animationView.loopMode = loopMode
        // 애니메이션 재생 시작
        animationView.play()
        // 오토레이아웃을 사용하기 위해 false로 설정
        animationView.translatesAutoresizingMaskIntoConstraints = false
        // 애니메이션 뷰를 컨테이너 뷰에 추가
        view.addSubview(animationView)
        // 애니메이션 뷰의 width/height를 부모 뷰와 같게 설정 (꽉 채움)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        // 완성된 UIView를 반환
        return view
    }
    // SwiftUI에서 뷰의 상태가 바뀔 때마다 호출, 여기서는 별도의 업데이트가 필요 없으므로 비워 둠.
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
