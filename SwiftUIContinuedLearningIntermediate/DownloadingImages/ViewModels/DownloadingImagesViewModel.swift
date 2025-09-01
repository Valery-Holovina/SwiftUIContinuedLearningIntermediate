//
//  DownloadingImagesViewModel.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 01.09.2025.
//

import Foundation



@Observable class DownloadingImagesViewModel{
    
    var dataArray: [PhotoModel] = []
    
    @ObservationIgnored let dataService = PhotoModelDataService.instance
    
}
