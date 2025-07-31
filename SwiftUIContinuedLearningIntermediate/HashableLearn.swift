//
//  HashableLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 31.07.2025.
//

import SwiftUI


struct MyCustomModel: Hashable{
    //we can use Identifiable instead of Hashable
    let title: String
    let subTitle: String
    
    // write hash and the func will be presented
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subTitle)
    }
    
}

struct HashableLearn: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One", subTitle: "1"),
        MyCustomModel(title: "Two", subTitle: "2"),
        MyCustomModel(title: "Three", subTitle: "3"),
        MyCustomModel(title: "Four", subTitle: "4"),
        MyCustomModel(title: "Five", subTitle: "5"),
    ]
    var body: some View {
        ScrollView{
            VStack(spacing: 40){
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                    Text(item.subTitle)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableLearn()
}
