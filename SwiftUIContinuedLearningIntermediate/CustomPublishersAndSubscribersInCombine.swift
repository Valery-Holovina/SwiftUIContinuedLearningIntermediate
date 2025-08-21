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
    
    @Published var showButton: Bool = false
    
    
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addButtonSubscriber(){
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self = self else {return}
                if isValid && count>=10{
                    self.showButton = true
                }else{
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
    
    func addTextFieldSubscriber(){
        $textFieldText
        // wait after stop typing
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map{ (text) -> Bool in
                
                if text.count > 3{
                    return true
                }else{
                    return false
                }
            }
        // to set a value
//            .assign(to: \.textIsValid, on: self)
        //better version
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
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
            
            TextField("Type here....", text: $vm.textFieldText)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .overlay (
                    ZStack{
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0:
                                vm.textIsValid ? 0.0: 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.textIsValid ? 1.0: 0.0)
                    }
                        .font(.title)
                    .padding(.trailing, 20)
                    
                    ,alignment: .trailing
                )
            
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .opacity(vm.showButton ? 1.0: 0.5)
                
                    
            }
            .disabled(!vm.showButton)

                
        }
    }
}

#Preview {
    CustomPublishersAndSubscribersInCombine()
}
