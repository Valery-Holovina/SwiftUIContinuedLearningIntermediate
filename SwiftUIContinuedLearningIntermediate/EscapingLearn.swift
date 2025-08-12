//
//  EscapingLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 12.08.2025.
//

import SwiftUI

@Observable class EscapingViewModel{
    
    var text: String = "Hello"
    
//    func getData(){
//        downloadData2 { returnedData in
//            text = returnedData
//        }
//    }
    
//    func getData(){
//        downloadData3 { [weak self] returnedData in
//            self?.text = returnedData
//        }
//    }
    
    func getData(){
        //for 4 is the same
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
    }
    
    // start
    func downloadData() -> String{
        return "New Data!"
    }
    
    // better
    func downloadData2(completionHandler: (_ data: String) -> ()){
        completionHandler("New Data!")
      
    }
    
    // right
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            completionHandler("New Data!")
        }
       
      
    }
    
    // improved right (+ DownloadResult)
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            let result = DownloadResult(data: "New Data!!!")
            completionHandler(result)
        }
       
      
    }
    
    
    //  Final one short
    func downloadData5(completionHandler: @escaping DownloadCompletion){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            let result = DownloadResult(data: "New Data!!!")
            completionHandler(result)
        }
       
      
    }
    
    
}

struct DownloadResult{
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingLearn: View {
    
    @State var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingLearn()
}
