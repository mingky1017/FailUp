//
//  RetouchView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//
import SwiftUI

struct WriteView: View {
    @State private var inputText: String = ""
    
    var body: some View {
        NavigationStack {
            
            // 입력창 영역
            VStack(alignment: .leading, spacing: 4) {
                ZStack(alignment: .topLeading) {
                    if inputText.isEmpty {
                        Text("무엇을 했을지 너무 궁금하다...")
                            .foregroundColor(Color(red: 0.768, green: 0.768, blue: 0.78)) // C4C4C7
                            .padding(.leading, 8)
                            .padding(.top, 12)
                    }
                    TextField("", text: $inputText)
                        .onChange(of: inputText) { // iOS 17 이상은 파라미터 없이 사용 권장
                            if inputText.count > 20 {
                                inputText = String(inputText.prefix(20))
                            }
                        }
                        .padding()
                        .font(.body)
                }
                .padding(.horizontal, 24)
                
                // 글자 수 카운터
                HStack {
                    Spacer()
                    Text("(\(inputText.count)/20)")
                        .font(.caption)
                        .foregroundColor(Color(red: 0.768, green: 0.768, blue: 0.78)) // C4C4C7
                        .padding(.trailing, 32)
                }
            }
            
            Spacer()
            
        }
    }
    
}

#Preview {
    WriteView()
}
