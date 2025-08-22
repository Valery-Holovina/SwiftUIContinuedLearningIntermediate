//
//  FileManagerLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 22.08.2025.
//

import SwiftUI

@Observable class FileManagerViewModel{
    
    var image: UIImage? = nil
    let imageName: String = "car"
    
    init() {
        getImageFromAssets()
    }
    
    func getImageFromAssets(){
        image = UIImage(named: imageName)
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
