//
//  RetouchView.swift
//  FailUp
//
//  Created by 윤민경 on 4/16/25.
//
import SwiftUI

struct WriteView: View {
    @Binding var failItem: FailItem
    @State private var inputText: String
    
    init(failItem: Binding<FailItem>) {
        self._failItem = failItem
        _inputText = State(initialValue: failItem.wrappedValue.text)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .topLeading) {
                if inputText.isEmpty {
                    Text("무엇을 했을지 너무 궁금하다...")
                        .foregroundColor(Color(red: 0.768, green: 0.768, blue: 0.78))
                }
                TextField("", text: $inputText)
                    .onChange(of: inputText) {
                        if inputText.count > 20 {
                            inputText = String(inputText.prefix(20))
                        }
                        failItem.text = inputText // ★ failItem.text와 동기화
                    }
                    .onChange(of: inputText) {
                        failItem.text = inputText
                    }
            }
            .font(.body)
        }
        .padding(.horizontal, 24)
        
        HStack {
            Spacer()
            Text("(\(inputText.count)/20)")
                .font(.caption)
                .foregroundColor(Color(red: 0.768, green: 0.768, blue: 0.78))
                .padding(.trailing, 32)
        }
        Spacer()
    }
}

struct WriteView_Previews: PreviewProvider {
    @State static var failItem: FailItem = FailData.shared.fails[0]
    
    static var previews: some View {
        WriteView(failItem: $failItem)
    }
}
