//
//  PagingScrollView.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 10.09.2025.
//

import SwiftUI

struct PagingScrollView: View {
    
    @State private var scrollPosition: Int? = nil
    
    var body: some View {
        VStack{
            Button("Scroll to") {
                scrollPosition = (0..<50).randomElement()!
            }
            ScrollView(.horizontal){
                HStack(spacing: 0) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                Text("\(index)").foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .id(index)
                            .scrollTransition(.interactive.threshold(.visible(0.4))) { content, phase in
                                content
                                // isIdentity - fully on the screen
                                    .opacity(phase.isIdentity ? 1: 0)
                                    .offset(y: phase.isIdentity ? 0: -100)
                            }
                    }
                }
                .padding(.vertical, 100)
            }
            .ignoresSafeArea()
            .scrollBounceBehavior(.basedOnSize)
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.smooth, value: scrollPosition)
            .scrollIndicators(.hidden)
            
            
        }
        
//        ScrollView{
//            VStack(spacing: 0) {
//                ForEach(0..<10) { index in
//                    Rectangle()
//                        .overlay {
//                            Text("\(index)").foregroundStyle(.white)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical, 10)
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollBounceBehavior(.basedOnSize) // you will not be able to move it if there are not many items
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging) // pages like in tik tok
//        .scrollIndicators(.hidden)
    }
}

#Preview {
    PagingScrollView()
}
