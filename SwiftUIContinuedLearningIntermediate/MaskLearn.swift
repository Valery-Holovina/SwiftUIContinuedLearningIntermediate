//
//  MaskLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 28.07.2025.
//

import SwiftUI

struct MaskLearn: View {
    
    @State var rating : Int = 1
    var body: some View {
        ZStack{
            starsView
                .overlay {overlayView.mask(starsView) // will shape as stars
                }
        }
    }
    
    private var overlayView: some View{
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
//                    .foregroundStyle(.yellow)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: CGFloat(rating)/5 * geometry.size.width)
                // /5 because have five stars
            }

        }
        .allowsHitTesting(false) // can not click

    }
    private var starsView: some View{
        HStack{
            ForEach(1..<6){ index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                   
                    }
            }
            
        }
    }
}

#Preview {
    MaskLearn()
}
