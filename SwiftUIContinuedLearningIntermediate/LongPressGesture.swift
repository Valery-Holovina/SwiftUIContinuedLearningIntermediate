//
//  LongPressGesture.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 22.07.2025.
//

import SwiftUI

//maximumDistance: you can press and move your finger

struct LongPressGestureLearn: View {
    @State var isComplete : Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        
        VStack{
            Rectangle()
                .fill(isSuccess ?  Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame( height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
    
            
            HStack{
                Text("Click here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing{
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        }else{
                            if !isSuccess{
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }

                        }
                    }

                
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
            
            
        }
        
        
        
        
        
        
        
//        Text(isComplete ? "Completed" : "Not Completed")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ?  Color.green : Color.gray)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//        
//        
//        
//            .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 50) {
//                isComplete.toggle()
//            }
    }
}

#Preview {
    LongPressGestureLearn()
}
