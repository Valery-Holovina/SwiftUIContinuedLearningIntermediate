//
//  FileManagerLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 22.08.2025.
//

import SwiftUI



class LocalFileManager{
    
    static let instance = LocalFileManager()
    let folderName: String = "MyApp_Images"
    
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded(){
        guard let path = FileManager
            .default.urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path else{
            return
        }
        
        if !FileManager.default.fileExists(atPath: path){
            do{
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("success creating folder")
            }catch let error{
                print("error creating folder")
            }
        }
    }
    
    func saveImage(image: UIImage, name: String)->String{
        
        guard let data = image.jpegData(compressionQuality: 1.0),
        let path = getPathForImage(name: name)
        else{
            return "Error getting data"
        }
        
        do{
            try data.write(to: path)
            print(path)
            return "Success saving"
        }catch let error{
            return "Error saving"
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
            .appendingPathComponent(folderName)
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
    
    
    func deleteImage(name:String)-> String{
        guard let path = getPathForImage(name: name),
              FileManager.default.fileExists(atPath: path.path) else{
            return "error getting path"
        }
        
        do{
            try FileManager.default.removeItem(at: path)
            return "successfully deleted"
        }catch let error{
            return "error deleting"
        }
    }

}







@Observable class FileManagerViewModel{
    
    var image: UIImage? = nil
    @ObservationIgnored let imageName: String = "car"
    @ObservationIgnored let manager = LocalFileManager.instance
    var infoMessage: String = ""
    
    init() {
        getImageFromAssets()
//        getImageFromFileManager()
    }
    
    func getImageFromAssets(){
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager(){
        image = manager.getImage(name: imageName)
    }
    
    
    func saveImage(){
        guard let image = image else {return}
        infoMessage =  manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage(){
        infoMessage = manager.deleteImage(name: imageName)
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
                
                HStack{
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
                    
                    Button {
                        vm.deleteImage()
                    } label: {
                        Text("Delete from FM")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top)
                    }
                }
                  
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)

                
                Spacer()
            }
            .navigationTitle("File Manager")
            
        }
    }
}

#Preview {
    FileManagerLearn()
}
