//
//  MultipleSheetsLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 28.07.2025.
//

import SwiftUI

struct RandomModel: Identifiable{
    let id = UUID().uuidString
    let title : String
}


// 1 - Binding
//2 - use multiple .sheets
//3 - use $item




// MARK: Binding Version
//struct MultipleSheetsLearn: View {
//    @State var selectedModel: RandomModel = RandomModel(title: "starting title")
//    @State var showSheet: Bool = false
//    
//    var body: some View {
//        VStack(spacing: 20){
//            Button("Button 1") {
//                selectedModel = RandomModel(title: "One")
//                showSheet.toggle()
//            }
//            Button("Button 2") {
//                selectedModel = RandomModel(title: "Two")
//                showSheet.toggle()
//            }
//        }
//        .sheet(isPresented: $showSheet) {
//            NextScreen(selectedModel: $selectedModel)
//        }
//    }
//}
//
//struct NextScreen: View {
//    @Binding var selectedModel : RandomModel
//    
//    var body: some View {
//        Text(selectedModel.title)
//            .font(.largeTitle)
//    }
//}
//
//#Preview {
//    MultipleSheetsLearn()
//}


struct MultipleSheetsLearn: View {
    @State var selectedModel: RandomModel = RandomModel(title: "starting title")
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            Button("Button 1") {
                selectedModel = RandomModel(title: "One")
                showSheet.toggle()
            }
            Button("Button 2") {
                selectedModel = RandomModel(title: "Two")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet) {
            NextScreen(selectedModel: $selectedModel)
        }
    }
}

struct NextScreen: View {
    @Binding var selectedModel : RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsLearn()
}
