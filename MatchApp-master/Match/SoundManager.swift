//
//  SoundManager.swift
//  Match
//
//  Created by Lucas Dahl on 1/9/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import Foundation
import AVFoundation

// "Static is used so a class is not needed in the viewController"
// a object of SoundManager wont need to be made, and you can just use Soundm=Manager
class SoundManager {
    
    static var auidoPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
    
    static func playSound(_ effect:SoundEffect) {
        
        var soundFileName = ""
        
        
        // Determine wich sound effect we want to play
        // And set the appropriate filename
        switch effect {
            
        case .flip:
            soundFileName = "cardflip"
            
        case .shuffle:
            soundFileName = "shuffle"
            
        case .match:
            soundFileName = "dingcorrect"
            
        case .nomatch:
            soundFileName = "dingwrong"
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find sound file \(soundFileName) in the bundle")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create audio player object
            auidoPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            auidoPlayer?.play()
        }
        catch {
            // Couldnt create audio player object, log the error
            print("Couldn't create the audio player object for sound file \(soundFileName)")
        }
    }
    
}
