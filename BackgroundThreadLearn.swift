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
        let newData = downloadData()
        dataArray = newData
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
            VStack(spacing: 10){
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
