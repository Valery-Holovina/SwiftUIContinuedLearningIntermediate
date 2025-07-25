//
//  GeometryReaderLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 25.07.2025.
//

import SwiftUI

struct GeometryReaderLearn: View {
    
    func getPercentage(geo : GeometryProxy) -> Double{
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1-(currentX/maxDistance))
    }
    
    var body: some View {
        
        ScrollView( .horizontal){
            HStack{
                ForEach(0..<20) { index in
                    GeometryReader{ geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40)
                                , axis: (x: 0.0, y:  1.0, z:  0.0))
                           
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
        .scrollIndicators(.hidden)
        
        
//        GeometryReader { geometry in
//            HStack(spacing: 0){
//                Rectangle()
//                    .fill(.red)
////                    .frame(width: UIScreen.main.bounds.width * 0.6666)
//                    .frame(width: geometry.size.width * 0.6666)
//                Rectangle()
//                    .fill(.blue)
//            }
//            .ignoresSafeArea()
//        }
      
    }
}

#Preview {
    GeometryReaderLearn()
}
