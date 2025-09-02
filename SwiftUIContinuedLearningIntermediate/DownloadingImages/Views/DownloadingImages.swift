//
//  DownloadingImages.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 01.09.2025.
//

import SwiftUI



struct DownloadingImages: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(vm.dataArray){ model in
                    HStack{
                        Circle()
                            .frame(width: 75, height: 75)
                        VStack(alignment: .leading){
                            Text(model.title)
                                .font(.headline)
                            Text(model.url)
                                .foregroundStyle(.gray)
                                .italic()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownloadingImages()
}
