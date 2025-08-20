//
//  TimerAndOnRecive.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 20.08.2025.
//

import SwiftUI

struct TimerAndOnRecive: View {
    
    // autoconnect to start as screen loads
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    
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
    /*
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
     */
    
    //Animation counter
    @State var count: Int = 0
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color.purple, Color.blue], center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
//            Text(dateFormator.string(from: currentDate))  //Timer
            /*Text(finishedText ?? "\(count)")*/      //Countdown
//            Text(timeRemaining) // Countdown to date
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
            
            HStack(spacing: 15){
                Circle()
                    .offset(y: count == 1 ? -20: 0)
                Circle()
                    .offset(y: count == 2 ? -20: 0)
                Circle()
                    .offset(y: count == 3 ? -20: 0)
            }
            .frame(width: 150)
            .foregroundStyle(.white)
            
            
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
//        .onReceive(timer) { _ in
//            updateTimeRemaining()
//        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)){
                count = count == 3 ? 0 : count+1
            }

        }
    }
}

#Preview {
    TimerAndOnRecive()
}
