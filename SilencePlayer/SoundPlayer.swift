//
//  SoundPlayer.swift
//  SilencePlayer
//
//  Created by Vidar on 13.04.2018.
//  Copyright © 2018 Vidar Tysse. All rights reserved.
//

import Cocoa
import AVFoundation

private var _player: AVAudioPlayer?

class SoundPlayer: NSObject {
    
    func playSound(file:String, ext:String) -> Void {
        let url = Bundle.main.url(forResource: file, withExtension: ext)!
        do {
            _player = try AVAudioPlayer(contentsOf: url)
            guard let player = _player else { return }
            player.numberOfLoops = -1   // Loop forever
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stop() -> Bool {
        if (_player != nil) {
            if (_player!.isPlaying) {
                _player!.stop()
                return true
            }
        }
        return false
    }
}
