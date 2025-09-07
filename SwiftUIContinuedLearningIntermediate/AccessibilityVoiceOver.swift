//
//  AccessibilityVoiceOver.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 07.09.2025.
//

import SwiftUI
// For blind people

// ask Siri to turn on Voice over on your device

// if swipe left it goes up
// if swipe right it goes down
// if swipe down goes to different section below


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
                        Text(isActive ? "True" : "False")
                            .accessibilityHidden(true) // will not say it
                    }
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                    .accessibilityElement(children: .combine) // groups two elements
                    .accessibilityAddTraits(.isButton) // says that it is a button
                    .accessibilityValue(isActive ? "is on" : "is off") // will say
                    .accessibilityHint("Double tap to toggle setting") // will also say this info
                    .accessibilityAction {
                        isActive.toggle()
                    }
                    
                    
                    
                } header: {
                    Text("Preferences")
                }
                
                Section {
                    Button("Favorites") {
                        
                    }
                    .accessibilityRemoveTraits(.isButton) // do not says button
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel("Favorites") // says instead of "love button" -> "favorites button"
                    
                    
                    Text("Favorites")
                        .accessibilityAddTraits(.isButton)
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
