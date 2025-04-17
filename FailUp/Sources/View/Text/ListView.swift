//
//  ListView.swift
//  FailUp
//
//  Created by 윤민경 on 4/17/25.
//

import SwiftUI



struct FailListView: View {
//    @State var fails: [FailItem] = []
//    var failData: FailData = .shared
    @State var fails: [FailItem] = FailData.shared.fails
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($fails) { fail in
                    NavigationLink {
                        ChallengeRecordEditView(
                            failItem: fail) // 리스트의 텍스트를 전달
                    } label: {
                        Text(fail.wrappedValue.text)
                            .font(.system(size: 15))
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    FailListView()
}

