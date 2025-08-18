//
//  DownloadWithCombine.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 18.08.2025.
//

import SwiftUI
import Combine

struct PostModel2: Identifiable, Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    
}

@Observable class DownloadWithCombineViewModel{
    
    var posts: [PostModel2] = []
    var cancellables = Set<AnyCancellable>()
    
    
    init() {
        getPosts()
    }
    
    func getPosts(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        
        // MARK: Combine discussion
        
        // 1. sign up for monthly subscription for package to be delivered
        // 2. the company would make the package behind the scene
        // 3. recieve the package at your fron door
        // 4. make sure box is not damaged
        // 5. open and make sure the item is correct
        // 6. use item!
        // 7. cancellable at any time!
        
        //-----------------------------------
        
        // 1. create the publisher
        // 2. subscribe publisher on background thread
        // 3. recieve on main thread
        // 4. tryMap (check that the data is good)
        // 5. decode (decode data into PostModels2)
        // 6. sink (put the item in our app)
        // store(cancel subscription if needed)
        
        URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .background))      // can go without that on background because already do it because of dataTask...
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel2].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: {[weak self] returnedPosts in
                self?.posts = returnedPosts
            })
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else{
            throw URLError(.badServerResponse)
        }
        return output.data
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
