//
//  AddSoundEffects.swift
//  SwiftUIContinuedLearningIntermediate
//
//  Created by Valery on 29.07.2025.
//

import SwiftUI
import AVKit  // audio video kit

class SoundManager{
    
    static let instance = SoundManager() // singleton
    //to use throughout all app
    
    var player : AVAudioPlayer?
    
    
    enum SoundOption: String{
        case piano
        case pool
    }
    
    func playSound(sound: SoundOption){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else{
            return
        }
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error {
            print("Error playing sound \(error.localizedDescription)")
        }
 
    }
    
}

struct AddSoundEffects: View {
    
    
    var body: some View {
        VStack(spacing: 40){
            Button("Play sound 1") {
                SoundManager.instance.playSound(sound: .piano)
            }
            Button("Play sound 2") {
                SoundManager.instance.playSound(sound: .pool)
            }
        }
    }
}

#Preview {
    AddSoundEffects()
}
