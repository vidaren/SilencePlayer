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
    @IBOutlet weak var PlayOnStartupCheckbox: NSButton!
    @IBOutlet weak var PlayButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlayOnStartupCheckbox.state = UserDefaults.standard.bool(forKey: "PlayOnStartup")
            ? NSControl.StateValue.on
            : NSControl.StateValue.off;
        if (PlayOnStartupCheckbox.state == NSControl.StateValue.on) {
            playButtonClicked(PlayButton);
        }
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    
    @IBAction func playOnStartupChanged(_ sender: NSButton) {
        let isChecked : Bool = PlayOnStartupCheckbox.state == NSControl.StateValue.on;
        UserDefaults.standard.set(isChecked, forKey: "PlayOnStartup");
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

