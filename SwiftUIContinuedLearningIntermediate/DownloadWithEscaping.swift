//
//  DownloadWithEscaping.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 15.08.2025.
//

import SwiftUI

//https://jsonplaceholder.typicode.com
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
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        downloadData(fromURl: url) { returnedData in
            if let data = returnedData{
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                DispatchQueue.main.async{ [weak self] in
                    self?.posts = newPosts
                }
            }else{
                print("No data returned")
            }
        }
            
        }
        
    }
    func downloadData(fromURl url: URL, completionHandler: @escaping (_ data: Data?) -> ()){
        // happens on background
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard
            let data = data,
            error == nil,
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300    // 200-299 successful responses
            else {
                print("ERROR Downloading Data")
                completionHandler(nil)
                return
            }
            completionHandler(data)
        
    }.resume() // to start it
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
