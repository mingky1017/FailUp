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
                
                ChallengeRecordView()

                Divider()
                    .frame(height: 0.33)
                    .background(Color.black)
                
                WriteView()
                
                EditCompletedView()
                
            }
        }
    }
}

#Preview {
    Content2View()
}
