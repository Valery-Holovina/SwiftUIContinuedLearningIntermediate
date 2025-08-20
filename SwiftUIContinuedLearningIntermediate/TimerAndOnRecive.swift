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
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
     */
    
    
    // Countdown to date
    @State var timeRemaining: String = ""
    //24 hours after today
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining(){
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color.purple, Color.blue], center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
//            Text(dateFormator.string(from: currentDate))  //Timer
            /*Text(finishedText ?? "\(count)")*/      //Countdown
            Text(timeRemaining) // Countdown to date
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            
        }
        //Timer
//        .onReceive(timer) { value in
//            currentDate = value
//        }
        
        //Countdown
//        .onReceive(timer) { _ in
//            if count<=1{
//                finishedText = "Wow!"
//            }else{
//                count -= 1
//            }
//        }
        
        // Countdown to date
        .onReceive(timer) { _ in
            updateTimeRemaining()
        }
    }
}

#Preview {
    TimerAndOnRecive()
}
