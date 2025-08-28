//
//  NSCacheUse.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 28.08.2025.
//

import SwiftUI


class CacheManager{
    
    static let instance = CacheManager() // Singleton
    private init(){}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 10mb
        return cache
    }()
    
    func add(image: UIImage, name: String){
        imageCache.setObject(image, forKey: name as NSString)
        print("Added to cache!")
    }
    
    func remove(name:String){
        imageCache.removeObject(forKey: name as NSString)
        print("removed from cache!")
    }
    
}



@Observable class CacheViewModel{
    
    var startingImage: UIImage? = nil
    @ObservationIgnored let imageName: String = "car"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder(){
        startingImage = UIImage(named: imageName)
    }
}


struct NSCacheUse: View {
    
    @State var vm = CacheViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                if let image = vm.startingImage{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                       
                }
                
                
                HStack{
                    Button {
                    
                    } label: {
                        Text("Save to Cache")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top)
                    }
                    
                    Button {
                    } label: {
                        Text("Delete from Cache")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top)
                    }
                }
             
                Spacer()
            }
            .navigationTitle("Cache use")
        }
    }
}

#Preview {
    NSCacheUse()
}
