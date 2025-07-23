//
//  RotationGestureLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 23.07.2025.
//

import SwiftUI

//test on simulator (use option button to get two fingers)

struct RotationGestureLearn: View {
    @State var angle : Angle = Angle(degrees: 0)
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged{ value in
                        angle = value
                    }
                    .onEnded{ value in
                        withAnimation(.easeInOut) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureLearn()
}
