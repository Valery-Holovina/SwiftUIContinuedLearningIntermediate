//
//  DownloadingImagesRow.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 02.09.2025.
//

import SwiftUI

struct DownloadingImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack{
            DownloadingImageView(url: model.image, key: "\(model.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading){
                Text(model.title)
                    .font(.headline)
                Text(model.image)
                    .foregroundStyle(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DownloadingImagesRow(model: PhotoModel(id: 1, title: "title", price: 12.5, description: "cool", category: "cloth", image: "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png"))
        .padding()
}
