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

#Preview {
    AlignmentGuideLearn()
}
