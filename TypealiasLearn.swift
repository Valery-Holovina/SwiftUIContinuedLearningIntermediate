//
//  TypealiasLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 12.08.2025.
//

import SwiftUI


struct MovieModel{
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasLearn: View {
    
    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item2 : TVModel = TVModel(title:  "Title2", director: "Lia", count: 6)
    
    var body: some View {
        VStack{
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
            Divider()
            Text(item2.title)
            Text(item2.director)
            Text("\(item2.count)")
        }
    }
}

#Preview {
    TypealiasLearn()
}
