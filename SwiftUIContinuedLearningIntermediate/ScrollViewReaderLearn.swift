//
//  ScrollViewReaderLearn.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 25.07.2025.
//

import SwiftUI

struct ScrollViewReaderLearn: View {
    
    @State var  textFieldText : String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            
            TextField("Enter a number here...", text: $textFieldText)
                .padding()
                .frame(height: 55)
                .border(.gray)
                .padding()
                .keyboardType(.numberPad) // alowes to enter only numbers
            
            Button("Scroll now") {
                withAnimation(.easeInOut) {
//                    proxy.scrollTo(30, anchor: .top)
                    if let index = Int(textFieldText){
                        scrollToIndex = index
                    }
                }
                
            }
            ScrollView{
                ScrollViewReader{ proxy in
                    
            
                    ForEach(0..<50) { index in
                        Text("This is item number \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            .shadow(radius: 10)
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        proxy.scrollTo(newValue, anchor: .top)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderLearn()
}
