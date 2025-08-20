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
    
    
    //Current Time
    /*
    @State var currentDate: Date = Date()
     
    var dateFormator: DateFormatter{
        let formator = DateFormatter()
        formator.timeStyle = .medium
        return formator
    }
     */
    
    
    // Countdown
    @State var count: Int = 10
    @State var finishedText: String? = nil
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color.purple, Color.blue], center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
//            Text(dateFormator.string(from: currentDate))
            Text(finishedText ?? "\(count)")
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            
        }
//        .onReceive(timer) { value in
//            currentDate = value
//        }
        .onReceive(timer) { _ in
            if count<=1{
                finishedText = "Wow!"
            }else{
                count -= 1
            }
        }
    }
}

#Preview {
    TimerAndOnRecive()
}
