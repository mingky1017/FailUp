//
//  FailData.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import Foundation
import Foundation

struct FailItem: Identifiable {
    let id = UUID()
    var text: String
    var date: Date = Date()
}

var failData: FailData = .shared

class FailData: ObservableObject {
    static let shared: FailData = .init() // Singleton pattern
    
    @Published var fails: [FailItem] = [
        FailItem(text: "첫 번째 실패"),
    ]
    
    func addFail(text: String, date: Date) {
        let newFail = FailItem(text: text, date: date)
        fails.append(newFail)
    }
    
    func removeFail(at offsets: IndexSet) {
        fails.remove(atOffsets: offsets)
    }
}
