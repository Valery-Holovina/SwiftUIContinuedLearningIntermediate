//
//  WeakSelfLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 11.08.2025.
//

import SwiftUI

struct WeakSelfLearn: View {
    @AppStorage("count") var count : Int?
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                WeakSelfSecondScreen()
            }
            .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10)),
            alignment: .topTrailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second view")
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject{
    var data: String? = nil
    
    init() {
        print("Initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("Deinitialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 500){ [weak self] in
            // we do not need it absolutely to stay alive
            self?.data = "New data"
        }
        
        
    }
}


#Preview {
    WeakSelfLearn()
}
