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
            VStack(spacing: 30) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .overlay {
                            Text("\(index)").foregroundStyle(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .containerRelativeFrame(.vertical, alignment: .center)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize) // you will not be able to move it if there are not many items
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging) // pages like in tik tok
        .scrollIndicators(.hidden)
    }
}

#Preview {
    PagingScrollView()
}
