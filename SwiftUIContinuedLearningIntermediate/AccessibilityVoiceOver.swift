//
//  AccessibilityVoiceOver.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 07.09.2025.
//

import SwiftUI

struct AccessibilityVoiceOver: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack{
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "ON" : "Off")
                    }
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                } header: {
                    Text("Preferences")
                }
                
                Section {
                    Button("Favorites") {
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    
                    Text("Favorites")
                        .onTapGesture {
                            
                        }

                } header: {
                    Text("Application")
                }
                
                VStack{
                    Text("CONTENT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { x in
                                VStack{
                                    Image("car")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 140, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text("item \(x)")
                                }
                                .onTapGesture {
                                    
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }


            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    AccessibilityVoiceOver()
}
