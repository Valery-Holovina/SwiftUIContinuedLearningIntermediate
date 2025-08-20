//
//  TimerAndOnRecive.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 20.08.2025.
//

import SwiftUI

struct TimerAndOnRecive: View {
    
    // autoconnect to start as screen loads
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var currentDate: Date = Date()
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color.purple, Color.blue], center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            Text(currentDate.description)
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            
        }
        .onReceive(timer) { value in
            currentDate = value
        }
    }
}

#Preview {
    TimerAndOnRecive()
}
