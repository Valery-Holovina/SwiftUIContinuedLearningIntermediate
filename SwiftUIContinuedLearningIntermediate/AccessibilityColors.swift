//
//  AccessibilityColors.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 06.09.2025.
//

import SwiftUI

struct AccessibilityColors: View {
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
    }
}

#Preview {
    AccessibilityColors()
}
