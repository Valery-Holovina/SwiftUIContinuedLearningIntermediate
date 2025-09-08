//
//  AlignmentGuideLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 08.09.2025.
//

import SwiftUI

struct AlignmentGuideLearn: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Hello, world")
                .background(.blue)
                .alignmentGuide(.leading) { dimentions in
//                    return 20 // 20 from its origin alignment
//                    return dimentions.width // whole width of the object
                    return dimentions.width * 0.5 // half width of the object
                    
                }
            Text("Other text is here")
                .background(.red)
        }
        .background(.orange)
    }
}

struct AlignmentChiledView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding(40)
    }
    private func row(title: String, showIcon: Bool) -> some View{
        HStack(spacing: 10) {
            if showIcon{
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
//                    .opacity(showIcon ? 1 : 0)
            }
            Text(title)
            Spacer()
        }
//        .background(.red)
        .alignmentGuide(.leading) { dimensions in
            return showIcon ? 40 : 0
        }
    }
}

#Preview {
    AlignmentChiledView()
}
