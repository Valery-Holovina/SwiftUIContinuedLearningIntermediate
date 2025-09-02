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
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownloadingImages()
}
