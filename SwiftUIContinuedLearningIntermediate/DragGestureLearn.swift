//
//  DragGestureLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 23.07.2025.
//

import SwiftUI

struct DragGestureLearn: View {
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack{
                Text("\(offset.width)")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                            
                        }
                        .onEnded{ value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                )
        }
    }
    func getScaleAmount() -> CGFloat{
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)// we only track if it goes left or right therefore .width
        //abs use because if we do not on the left it will go bigger
        let percentage = currentAmount / max //how far we are from the starting amount in %
        return 1.0 - min(percentage, 0.5) * 0.5 // stops when 0.5 (min :), make it even bigger by * 0.5
        
    }
    
    func getRotationAmount() -> Double{
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageDouble = Double(percentage)
        let maxAngle : Double = 10
        return percentageDouble * maxAngle
    }
}

#Preview {
    DragGestureLearn()
}
