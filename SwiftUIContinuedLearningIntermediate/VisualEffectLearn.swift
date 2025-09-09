//
//  VisualEffectLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 09.09.2025.
//

import SwiftUI

struct VisualEffectLearn: View {
    
//    @State private var showSpacer: Bool = false
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.yellow)
                        .visualEffect { content, geometryProxy in
                            content
                                .offset(x: geometryProxy.frame(in: .global).minY * 0.5)
                        }
                }
            }
        }
        
        
        
        
        
        
        
        
//        VStack{
//            Text("Hello, World! djdjjdjdjjdjdmdmmddmmdmdmdmdmmdmdmdm")
//                .padding()
//                .background(.red)
//                .visualEffect { content, geometry in
//                    content
//                    //                    .grayscale(geometry.size.width >= 200 ? 1 : 0)
//                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
//                }
//            if showSpacer{
//                Spacer()
//            }
//        }
//        .animation(.easeIn, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
    }
}

#Preview {
    VisualEffectLearn()
}
