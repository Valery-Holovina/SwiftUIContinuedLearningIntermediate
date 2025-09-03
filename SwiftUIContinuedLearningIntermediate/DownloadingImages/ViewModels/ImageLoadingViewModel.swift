//
//  ImageLoadingViewModel.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 02.09.2025.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject{
   
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    let manager = PhotoModelCacheManager.instance
    
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    func getImage(){
        if let savedImage = manager.get(key: imageKey){
            image = savedImage
            print("getting saved image")
        }else{
            downloadImage()
            print("Downloading image now")
        }
    }
    
    func downloadImage(){
        print("Downloading image now")
        isLoading = true
        guard let url = URL(string: urlString) else{
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
        // tryMap if you care about the errors / map do not care
            .map{ UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returenedImage in
                guard let self = self,
                      let image = returenedImage else{return}
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)

    }
}
