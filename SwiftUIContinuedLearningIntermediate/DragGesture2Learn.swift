//
//  DragGesture2Learn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 23.07.2025.
//

import SwiftUI

struct DragGesture2Learn: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.84
    @State var currentOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
         
            
            mySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()) {
                                currentOffsetY = value.translation.height
                            }
                            
                        }
                        .onEnded{ value in
                           
                            withAnimation(.spring()) {
                                if currentOffsetY < -150{
                                    endingOffsetY = -startingOffsetY
                                }else if endingOffsetY != 0 && currentOffsetY > 150{
                                    endingOffsetY = 0
                                }
                                currentOffsetY = 0
                              
                            }
                        }
                )
//            Text("\(currentOffsetY)")
        }
        
        .ignoresSafeArea(edges: .bottom)
      
    }
  
}

#Preview {
    DragGesture2Learn()
}

struct mySignUpView: View {
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("This is the description for my app. I have no idea what to write here. I wish you all great day")
                .multilineTextAlignment(.center)
            Text("Create an acount")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
