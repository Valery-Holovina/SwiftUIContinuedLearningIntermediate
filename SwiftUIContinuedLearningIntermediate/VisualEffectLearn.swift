//
//  VisualEffectLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 09.09.2025.
//

import SwiftUI

struct VisualEffectLearn: View {
    
    @State private var showSpacer: Bool = false
    
    var body: some View {
        VStack{
            Text("Hello, World! djdjjdjdjjdjdmdmmddmmdmdmdmdmmdmdmdm")
                .padding()
                .background(.red)
                .visualEffect { content, geometry in
                    content
                    //                    .grayscale(geometry.size.width >= 200 ? 1 : 0)
                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
                }
            if showSpacer{
                Spacer()
            }
        }
        .animation(.easeIn, value: showSpacer)
        .onTapGesture {
            showSpacer.toggle()
        }
    }
}

#Preview {
    VisualEffectLearn()
}
