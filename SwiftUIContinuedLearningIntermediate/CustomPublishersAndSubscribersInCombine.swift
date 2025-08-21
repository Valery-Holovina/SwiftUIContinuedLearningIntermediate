//
//  CustomPublishersAndSubscribersInCombine.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 21.08.2025.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject{
    
    @Published var count: Int = 0
//    @ObservationIgnored var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
    }
    
    
    
    func addTextFieldSubscriber(){
        $textFieldText
            .map{ (text) -> Bool in
                
                if text.count > 3{
                    return true
                }else{
                    return false
                }
            }
        // to set a value
            .assign(to: \.textIsValid, on: self)
            .store(in: &cancellables)
    }
    
    
    func setUpTimer(){
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
        // we can not use onRecieve here so we use sink
            .sink { [weak self] _ in
                guard let self = self else {return}
                self.count += 1
                
//                if self.count >= 10{
////                    self.timer?.cancel()
//                    
//                    for item in self.cancellables{
//                        item.cancel()
//                    }
//                }
            }
            .store(in: &cancellables)
        
    }
    
    
}


struct CustomPublishersAndSubscribersInCombine: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack{
            Text("\(vm.count)")
                .font(.largeTitle)
            Text(vm.textIsValid.description)
            
            TextField("Type here....", text: $vm.textFieldText)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
        }
    }
}

#Preview {
    CustomPublishersAndSubscribersInCombine()
}
