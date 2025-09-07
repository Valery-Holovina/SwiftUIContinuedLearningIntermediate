//
//  AccessibilityVoiceOver.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 07.09.2025.
//

import SwiftUI

struct AccessibilityVoiceOver: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack{
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "ON" : "Off")
                    }
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                } header: {
                    Text("Preferences")
                }

            }
        }
    }
}

#Preview {
    AccessibilityVoiceOver()
}
