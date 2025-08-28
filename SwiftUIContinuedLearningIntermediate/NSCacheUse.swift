//
//  NSCacheUse.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 28.08.2025.
//

import SwiftUI

struct NSCacheUse: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("car")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                   
                

                
                
                
                HStack{
                    Button {
                    
                    } label: {
                        Text("Save to Cache")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top)
                    }
                    
                    Button {
                    } label: {
                        Text("Delete from Cache")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top)
                    }
                }
             
                Spacer()
            }
            .navigationTitle("Cache use")
        }
    }
}

#Preview {
    NSCacheUse()
}
