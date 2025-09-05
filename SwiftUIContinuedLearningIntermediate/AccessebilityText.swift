//
//  AccessebilityText.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 05.09.2025.
//

import SwiftUI

// Dynamic text

struct AccessebilityText: View {
    
    @Environment(\.dynamicTypeSize) var sizes
    
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
                            .frame(maxWidth: .infinity, alignment: .leading)
                        /*     .truncationMode(.tail)*/ // where i want to see the dots
                             .lineLimit(3)
//                             .minimumScaleFactor(sizes > .large ? 0.8: 1.0)
                             .minimumScaleFactor(sizes.customMinScaleFactor)
                    }
                    .background(.red)
              
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hello, world")
        }

    }
}

extension DynamicTypeSize{
    var customMinScaleFactor: CGFloat{
        switch self {
        case .xSmall, .small, .medium:
            return 1.0
        case .large, .xLarge, .xxLarge:
            return 0.8
            default:
            return 0.6
        }
    }
}

#Preview {
    AccessebilityText()
}
