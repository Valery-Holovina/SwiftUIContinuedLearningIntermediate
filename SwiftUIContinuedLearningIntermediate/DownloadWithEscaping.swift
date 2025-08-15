//
//  DownloadWithEscaping.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 15.08.2025.
//

import SwiftUI

// https://app.quicktype.io

struct PostModel: Identifiable, Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    
    
    
}





@Observable class DownloadWithEscapingViewModel{
    
    var posts : [PostModel] = []
    
    init() {
        getPosts()
    }
    
    // download posts from the Internet
    func getPosts(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {return}
        
        
        // happens on background
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print("No Data")
                return
            }
            
            guard error == nil else {
                print("ERROR")
                return
            }
            
       
            guard let response = response as? HTTPURLResponse else{
                print("Invalid response")
                return
            }
            
            // 200-299 successful responses
            guard response.statusCode >= 200 && response.statusCode < 300 else{
                print("Status is \(response.statusCode) (((")
                return
            }
            
//            print("Successfuly downloaded data!!!")
//            print(data)
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
            
            
            guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
            DispatchQueue.main.async{ [weak self] in
                self?.posts.append(newPost)
            }
            
            
        }.resume() // to start it
    }
}




struct DownloadWithEscaping: View {
    
    @State var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        List{
            ForEach(vm.posts){post in
                VStack(alignment: .leading){
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
    }
}

#Preview {
    DownloadWithEscaping()
}
