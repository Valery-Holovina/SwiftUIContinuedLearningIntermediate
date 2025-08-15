//
//  DownloadWithEscaping.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 15.08.2025.
//

import SwiftUI

@Observable class DownloadWithEscapingViewModel{
    
    init() {
        getPosts()
    }
    
    // download posts from the Internet
    func getPosts(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {return}
        
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
            
            print("Successfuly downloaded data!!!")
            print(data)
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
        }.resume() // to start it
    }
}

struct DownloadWithEscaping: View {
    
    @State var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DownloadWithEscaping()
}
