//
//  PagingScrollView.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 10.09.2025.
//

import SwiftUI

struct PagingScrollView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 0) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .overlay {
                            Text("\(index)").foregroundStyle(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .containerRelativeFrame(.vertical, alignment: .center)
                }
            }
        }
        .ignoresSafeArea()
        .scrollBounceBehavior(.basedOnSize) // you will not be able to move it if there are not many items
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging) // pages like in tik tok
        .scrollIndicators(.hidden)
    }
}

#Preview {
    PagingScrollView()
}
