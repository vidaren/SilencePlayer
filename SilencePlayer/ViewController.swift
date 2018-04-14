//
//  ViewController.swift
//  SilencePlayer
//
//  Created by Vidar on 13.04.2018.
//  Copyright © 2018 Vidar Tysse. All rights reserved.
//

import Cocoa

var soundPlayer: SoundPlayer?

class ViewController: NSViewController {
    
    @IBOutlet weak var nowPlayingLabel: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func playButtonClicked(_ sender: Any) {
        if (soundPlayer != nil) {
            if (soundPlayer!.stop()) {
                let btn = sender as! NSButton
                btn.title = "Play silence"
                nowPlayingLabel.stringValue = "- - -"
                return
            }
        }
        else {
            soundPlayer = SoundPlayer()
        }
        soundPlayer!.playSound(file: "silence", ext: "mp3")
        let btn = sender as! NSButton
        btn.title = "Stop it"
        nowPlayingLabel.stringValue = "Now playing silence"
    }
}

