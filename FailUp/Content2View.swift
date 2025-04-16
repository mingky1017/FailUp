//
//  Content2View.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//

import SwiftUI

struct Content2View: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                    .frame(height: 0.33)
                
                WriteView()
                    .padding()
                
                EditCompletedView()
                    .padding()
            }
            
            .navigationTitle("나의 도전 기록")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Content2View()
}
