//
//  CustomPublishersAndSubscribersInCombine.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 21.08.2025.
//

import SwiftUI
import Combine


@Observable class SubscriberViewModel{
    
    var count: Int = 0
//    @ObservationIgnored var timer: AnyCancellable?
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        setUpTimer()
    }
    
    
    
    func setUpTimer(){
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
        // we can not use onRecieve here so we use sink
            .sink { [weak self] _ in
                guard let self = self else {return}
                self.count += 1
                
                if self.count >= 10{
//                    self.timer?.cancel()
                    
                    for item in self.cancellables{
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
        
    }
    
    
}


struct CustomPublishersAndSubscribersInCombine: View {
    
    @State var vm = SubscriberViewModel()
    
    var body: some View {
        VStack{
            Text("\(vm.count)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    CustomPublishersAndSubscribersInCombine()
}
