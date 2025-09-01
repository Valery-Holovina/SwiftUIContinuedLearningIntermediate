//
//  DownloadingImagesViewModel.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 01.09.2025.
//

import Foundation
import Combine



class DownloadingImagesViewModel: ObservableObject{
    
    @Published var dataArray: [PhotoModel] = []
    
    let dataService = PhotoModelDataService.instance
    
    var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$photoModels
            .sink{[weak self] returnedPhotModels in
                self?.dataArray = returnedPhotModels
            }
            .store(in: &cancellables)
    }
    
}
