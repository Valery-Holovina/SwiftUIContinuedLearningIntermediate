//
//  FileManagerLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 22.08.2025.
//

import SwiftUI



class LocalFileManager{
    
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String){
        
        guard let data = image.jpegData(compressionQuality: 1.0),
        let path = getPathForImage(name: name)
        else{
            print("Error getting data")
            return
        }
        
        do{
            try data.write(to: path)
            print("Success saving")
        }catch let error{
            print("Error saving")
        }
                
    
    }
    
    
    
    func getPathForImage(name:String)->URL?{
        // can not be recreated (Document)
//        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //---------
        
        // can be downloaded again (Caches)
        guard let path = FileManager
            .default.urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("\(name).jpg") else{
            print("Error getting path")
            return nil
        }
        return path
        
        //--------------
        // temporary data (Temporary)
//        let directory3 = FileManager.default.temporaryDirectory

    }
    
    
    
    
    func getImage(name: String)->UIImage?{
        // .path returns url in String
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else{
            print("error getting path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
}



@Observable class FileManagerViewModel{
    
    var image: UIImage? = nil
    let imageName: String = "car"
    let manager = LocalFileManager.instance
    
    init() {
        getImageFromAssets()
    }
    
    func getImageFromAssets(){
        image = UIImage(named: imageName)
    }
    
    func saveImage(){
        guard let image = image else {return}
        manager.saveImage(image: image, name: imageName)
    }
}

struct FileManagerLearn: View {
    
    @State var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                
                if let image = vm.image{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top,30)
                }
                  
             
                Button {
                    vm.saveImage()
                } label: {
                    Text("Save to FM")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top)
                }

                
                Spacer()
            }
            .navigationTitle("File Manager")
            
        }
    }
}

#Preview {
    FileManagerLearn()
}
