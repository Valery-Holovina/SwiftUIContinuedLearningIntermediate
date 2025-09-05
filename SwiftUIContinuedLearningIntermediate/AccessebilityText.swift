//
//  AccessebilityText.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 05.09.2025.
//

import SwiftUI

// Dynamic text

struct AccessebilityText: View {
    var body: some View {
        NavigationStack{
            List{
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack{
                            Image(systemName: "heart.fill")
                            Text("Welcome to my app")
                        }
                        .font(.title)
                        Text("This is some longer text that expandes to multiple lines.")
                            .font(.subheadline)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hello, world")
        }

    }
}

#Preview {
    AccessebilityText()
}
