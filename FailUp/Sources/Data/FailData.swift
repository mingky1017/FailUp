//
//  FailData.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import Foundation

struct FailItem: Identifiable, Codable {
    let id: UUID
    var text: String
    var date: Date

    init(id: UUID = UUID(), text: String, date: Date = Date()) {
        self.id = id
        self.text = text
        self.date = date
    }
}

class FailData: ObservableObject {
    static let shared: FailData = .init()
    
    @Published var fails: [FailItem] = [] {
        didSet { saveData() }
    }
    @Published var kg: Int = 0 {
        didSet { saveData() }
    }
    
    private let failsKey = "FailData.fails"
    private let kgKey = "FailData.kg"
    
    init() {
        loadData()
        if fails.isEmpty {
            fails = [FailItem(text: "첫 번째 실패")]
        }
    }
    
    func addFail(text: String, date: Date) {
        let newFail = FailItem(text: text, date: date)
        fails.append(newFail)
        kg += 10
    }
    
    func removeFail(at offsets: IndexSet) {
        fails.remove(atOffsets: offsets)
        kg -= 10 * offsets.count
        if kg < 0 { kg = 0 }
    }
    
    private func saveData() {
        if let encoded = try? JSONEncoder().encode(fails) {
            UserDefaults.standard.set(encoded, forKey: failsKey)
        }
        UserDefaults.standard.set(kg, forKey: kgKey)
    }
    
    private func loadData() {
        if let data = UserDefaults.standard.data(forKey: failsKey),
           let decoded = try? JSONDecoder().decode([FailItem].self, from: data) {
            self.fails = decoded
        }
        self.kg = UserDefaults.standard.integer(forKey: kgKey)
    }
}

