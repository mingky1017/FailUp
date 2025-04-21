//
//  FailData.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

//import SwiftData
import Foundation

//@Model
struct FailItem: Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case id
        case text
        case date
    }
    
    var id: UUID
    var text: String
    var date: Date

    init(id: UUID = UUID(), text: String, date: Date = Date()) {
        self.id = id
        self.text = text
        self.date = date
    }
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(UUID.self, forKey: .id)
//        text = try container.decode(String.self, forKey: .text)
//        date = try container.decode(Date.self, forKey: .date)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(text, forKey: .text)
//        try container.encode(date, forKey: .date)
//    }
}

class FailData: ObservableObject {
    static let shared: FailData = .init()
    
    @Published var fails: [FailItem] = [] {
        didSet { saveData() }
    }
    @Published var kg: Int = 0 {
        didSet { saveData() }
    }
    @Published var lastKgDate: Date = Date() {
        didSet { saveData() }
    }
    
    private let failsKey = "FailData.fails"
    private let kgKey = "FailData.kg"
    private let lastKgDateKey = "FailData.lastKgDate"
    
    init() {
        loadData()
        let cnt = fails.filter { Calendar.current.isDateInToday($0.date) }.count
        kg  = cnt * 10
        lastKgDate = Date()
        saveData()
//        }
    }
    
    func addFail(text: String, date: Date) {
        let newFail = FailItem(text: text, date: date)
        fails.append(newFail)
        kg += 10
        lastKgDate = Date()
    }
    
    func removeFail(at offsets: IndexSet) {
        fails.remove(atOffsets: offsets)
        kg -= 10 * offsets.count
        if kg < 0 { kg = 0 }
        lastKgDate = Date()
    }
    
    private func saveData() {
        if let encoded = try? JSONEncoder().encode(fails) {
            UserDefaults.standard.set(encoded, forKey: failsKey)
        }
        UserDefaults.standard.set(kg, forKey: kgKey)
        UserDefaults.standard.set(lastKgDate, forKey: lastKgDateKey)
    }
    
    private func loadData() {
        if let data = UserDefaults.standard.data(forKey: failsKey),
           let decoded = try? JSONDecoder().decode([FailItem].self, from: data) {
            self.fails = decoded
        }
        self.kg = UserDefaults.standard.integer(forKey: kgKey)
        self.lastKgDate = UserDefaults.standard.object(forKey: lastKgDateKey) as? Date ?? Date()
    }
}
