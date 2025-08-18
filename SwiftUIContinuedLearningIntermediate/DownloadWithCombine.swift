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

@Observable class DownloadWithCombineViewModel{
    var posts: [PostModel2] = []
}

struct DownloadWithCombine: View {
    
    @State var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List{
            ForEach(vm.posts) { post in
                VStack{
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
