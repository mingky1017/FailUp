//
//  ContentView.swift
//  FailUp
//
//  Created by 윤민경 on 4/15/25.
//
import SwiftUI


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct MainView: View {
    @ObservedObject var failData = FailData.shared
    @State private var inputText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                MainTextView(kg: failData.kg)
                    .padding(.bottom, 30)
                LottieView(filename: "muscles")
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 30)
                FailTextFieldView(failData: failData, inputText: $inputText)
                PastRecordView()
                    .padding(.bottom, 30)
                VStack {
                    Text("오늘의 실패 근육은 내일의 용기 근육")
                        .font(.callout)
                        .fontWeight(.regular)
                    Text("실패가 아니라 도전이다")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .font(.system(size: 16))
                .foregroundColor(Color(red: 0.431, green: 0.341, blue: 0.055))
            }
            .padding(.horizontal, 5)
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

#Preview {
    MainView()
}
