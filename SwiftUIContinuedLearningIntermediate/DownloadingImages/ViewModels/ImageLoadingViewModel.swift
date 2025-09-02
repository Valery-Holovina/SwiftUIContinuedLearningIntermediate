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
    
    let urlString: String
    
    init(url: String) {
        urlString = url
        downloadImage()
    }
    
    
    func downloadImage(){
        
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
                self?.image = returenedImage
            }
            .store(in: &cancellables)

    }
}
