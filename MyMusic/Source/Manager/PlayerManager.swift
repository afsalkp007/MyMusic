//
//  PlayerManager.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import AVFoundation

class PlayerManager {
    
    var player: AVAudioPlayer?
    
    func playAudio(trackName: String) {
        let urlString = Bundle.main.path(forResource: trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            
            player.play()
            
        } catch let error {
            print("Error occured: \(error.localizedDescription)")
        }
    }
    
    func stopAudio() {
        if let player = player {
            player.stop()
        }
        
    }
}
