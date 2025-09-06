//
//  AccessibilityColors.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 06.09.2025.
//

import SwiftUI

// XCode -> Open Developer Tool -> Accessebility inspector ->
// Window -> Show Color Contrast Calculation
// (should be at least 4.5 - 7 : 1)

struct AccessibilityColors: View {
    
    // if person has reduce transparency in their settings
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    
    
    var body: some View {
        VStack{
            Button("Button 1") {
                
            }
            .foregroundStyle(.primary)
            .buttonStyle(.borderedProminent)
            
            Button("Button 2") {
                
            }
            .tint(.orange)
            .buttonStyle(.borderedProminent)
            Button("Button 3") {
                
            }
            .tint(.green)
            .buttonStyle(.borderedProminent)
            Button("Button 4") {
                
            }
            .tint(.purple)
            .buttonStyle(.borderedProminent)
        }
        .font(.largeTitle)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background( reduceTransparency ?  .black : .black.opacity(0.5))
    }
}

#Preview {
    AccessibilityColors()
}
