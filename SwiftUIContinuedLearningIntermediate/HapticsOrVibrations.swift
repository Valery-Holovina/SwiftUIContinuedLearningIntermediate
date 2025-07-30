//
//  HapticsOrVibrations.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 30.07.2025.
//

import SwiftUI

//Test on real phone

class HapticManager{
    static let instance = HapticManager() // singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style:style)
        generator.impactOccurred()
    }
}

struct HapticsOrVibrations: View {
    var body: some View {
        VStack(spacing: 20){
            Button("success") {HapticManager.instance.notification(type: .success)}
            Button("warning") {HapticManager.instance.notification(type: .warning)}
            Button("error") {HapticManager.instance.notification(type: .error)}
            Divider()
            Button("heavy") {HapticManager.instance.impact(style: .heavy)}
        }
    }
}

#Preview {
    HapticsOrVibrations()
}
