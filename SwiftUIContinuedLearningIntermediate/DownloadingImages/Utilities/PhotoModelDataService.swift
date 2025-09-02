//
//  PhotoModelDataService.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 01.09.2025.
//

import Foundation
import Combine

class PhotoModelDataService{
    
    static let instance = PhotoModelDataService() // singleton
    
    @Published var photoModels: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    
    private init(){
        downloadData()
    }
    
    
    func downloadData(){
        
        guard let url = URL(string: "https://fakestoreapi.com/products?utm_source=chatgpt.com") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print("error downloading data")
                }
            } receiveValue: {[weak self] returnedPhotoModels in
                self?.photoModels = returnedPhotoModels
            }
            .store(in: &cancellables)

        
    }
    
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else{
            throw URLError(.badServerResponse)
        }
        return output.data
        
    }
}
