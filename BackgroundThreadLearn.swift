//
//  BackgroundThreadLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 11.08.2025.
//

import SwiftUI

@Observable class BackgroundThreadViewModel{
    
    var dataArray : [String] = []
    
    func fetchData(){
        
        // Happens on the background thread
        DispatchQueue.global(qos: .background).async{
            // download the data
            let newData = self.downloadData()
            
            // if you want to understand on which thread you are
            print("Check 1 \(Thread.isMainThread)")
            print("Check 1 \(Thread.current)")
            
            
            //switch to main thread
            // Happens on the main thread
            DispatchQueue.main.async {
                self.dataArray = newData
                
                print("Check 2 \(Thread.isMainThread)")
                print("Check 2 \(Thread.current)")
            }
           
        }
        
        
        
    }
    
    private func downloadData() -> [String]{
        var data : [String] = []
        
        for x in 0..<100{
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadLearn: View {
    
    @State var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 10){
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
                
            }
        }
    }
}

#Preview {
    BackgroundThreadLearn()
}
