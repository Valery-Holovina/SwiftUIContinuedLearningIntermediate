//
//  DownloadingImageView.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 02.09.2025.
//

import SwiftUI

struct DownloadingImageView: View {
    
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String) {
        // because of StateObject use _
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack{
            if loader.isLoading{
                ProgressView()
            }else if let image = loader.image{
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    DownloadingImageView(url: "https://picsum.photos/seed/picsum/200/300", key: "1")
//        .frame(width: 75, height: 75)
}
