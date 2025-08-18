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
    
    init() {
        getPosts()
    }
    
    func getPosts(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        // 1. sign up for monthly subscription for package to be delivered
        // 2. the company would make the package behind the scene
        // 3. recieve the package at your fron door
        // 4. make sure box is not damaged
        // 5. open and make sure the item is correct
        // 6. use item!
        // 7. cancellable at any time!
        
        
        
        
    }
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
