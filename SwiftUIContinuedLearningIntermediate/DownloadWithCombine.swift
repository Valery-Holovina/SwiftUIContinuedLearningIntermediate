//
//  DownloadWithCombine.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 18.08.2025.
//

import SwiftUI

struct PostModel2: Identifiable, Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    
}


struct DownloadWithCombine: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DownloadWithCombine()
}
