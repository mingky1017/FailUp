// 파일 이름, 프로젝트 이름, 작성자, 날짜를 알려주는 주석
//  FailData.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

// SwiftData(주석 처리), Foundation 프레임워크를 불러 옴.
// Foundation은 Date, UUID, Codable 등 기본 타입을 제공.
import Foundation

//@Model, 실패 기록 데이터 모델
// 실패 기록 하나를 표현하는 데이터 구조체
// `Identifiable`: 리스트에서 각 항목을 고유하게 식별할 수 있게 해줌 (id 필요)
// `Codable`: JSON 등으로 인코딩/디코딩(저장/불러오기) 가능하게 해줌
struct FailItem: Identifiable, Codable {
    // Codable에서 각 프로퍼티의 키를 지정 (자동 생성도 가능, 명시적으로도 가능)
    enum CodingKeys: CodingKey {
        // 각 기록의 고유 식별자 (자동 생성 가능)
        case id
        // 실패 기록의 내용(텍스트)
        case text
        // 실패 기록이 생성된 날짜
        case date
    }
    
    var id: UUID
    var text: String
    var date: Date
    
    // 기본 생성자, id와 date는 기본값(자동 생성) 제공
    init(id: UUID = UUID(), text: String, date: Date = Date()) {
        self.id = id
        self.text = text
        self.date = date
    }
}
// 실패 기록 전체를 관리, 실패 기록 전체를 관리하는 데이터 저장소 클래스
// `ObservableObject`: SwiftUI에서 이 객체의 값이 바뀌면 화면이 자동으로 업데이트됨
class FailData: ObservableObject {
    // 싱글톤 패턴, 앱 전체에서 하나만 사용하는 객체, 어디서든 `FailData.shared`로 접근
    static let shared: FailData = .init()
    
    // 실패 기록들의 배열, 값이 바뀌면 자동으로 `saveData()` 호출(자동 저장)
    @Published var fails: [FailItem] = [] {
        didSet { saveData() }
    }
    // 실패 기록의 “무게” (예: 실패 1개당 10kg씩 증가), 값이 바뀌면 자동 저장
    @Published var kg: Int = 0 {
        didSet { saveData() }
    }
    // 마지막으로 kg가 변경된 날짜
    @Published var lastKgDate: Date = Date() {
        didSet { saveData() }
    }
    // UserDefaults에 데이터를 저장할 때 사용할 키(문자열)
    private let failsKey = "FailData.fails"
    private let kgKey = "FailData.kg"
    private let lastKgDateKey = "FailData.lastKgDate"
    
    // 초기화(init)와 데이터 로딩
    init() {
        loadData()
        // 앱이 시작될 때 UserDefaults에서 데이터를 불러옴
        let cnt = fails.filter { Calendar.current.isDateInToday($0.date) }.count
        //  오늘 날짜의 실패 기록 개수를 세서, kg를 계산(1개당 10kg)
        kg  = cnt * 10
        // lastKgDate를 오늘로 설정
        lastKgDate = Date()
        // 저장
        saveData()
    }
    // 실패 기록 추가/삭제
    func addFail(text: String, date: Date) {
        let newFail = FailItem(text: text, date: date)
        // 새로운 실패 기록을 추가
        fails.append(newFail)
        // kg는 10씩 증가
        kg += 10
        //  마지막 변경 날짜 갱신
        lastKgDate = Date()
    }
    // 선택한 기록을 삭제
    func removeFail(at offsets: IndexSet) {
        // kg는 10*삭제개수만큼 감소 (음수 방지)
        fails.remove(atOffsets: offsets)
        kg -= 10 * offsets.count
        if kg < 0 { kg = 0 }
        // 마지막 변경 날짜 갱신
        lastKgDate = Date()
    }
    // 데이터 저장/불러오기(UserDefaults 사용)
    // 실패 기록 배열(fails)은 JSON으로 인코딩해서 저장
    private func saveData() {
        if let encoded = try? JSONEncoder().encode(fails) {
            UserDefaults.standard.set(encoded, forKey: failsKey)
        }
        UserDefaults.standard.set(kg, forKey: kgKey)
        // kg, lastKgDate는 각각 저장
        UserDefaults.standard.set(lastKgDate, forKey: lastKgDateKey)
    }
    // 저장된 데이터가 있으면 불러와서 각각 프로퍼티에 할당
    private func loadData() {
        if let data = UserDefaults.standard.data(forKey: failsKey),
           let decoded = try? JSONDecoder().decode([FailItem].self, from: data) {
            self.fails = decoded
        }
        self.kg = UserDefaults.standard.integer(forKey: kgKey)
        self.lastKgDate = UserDefaults.standard.object(forKey: lastKgDateKey) as? Date ?? Date()
    }
}
