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
    @IBOutlet weak var PlayButton: NSButton!
    @IBOutlet weak var PlayOnStartupCheckbox: NSButton!
    @IBOutlet weak var HideOnStartupCheckbox: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlayOnStartupCheckbox.state = getControlStateFromBoolDefault("PlayOnStartup")
        if PlayOnStartupCheckbox.state == NSControl.StateValue.on {
            playButtonClicked(PlayButton)
        }
        
        HideOnStartupCheckbox.state = getControlStateFromBoolDefault("HideOnStartup")
        if HideOnStartupCheckbox.state == NSControl.StateValue.on {
            NSApplication.shared.hide(nil)
        }
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func playOnStartupChanged(_ sender: NSButton) {
        setBoolDefaultFromControlState("PlayOnStartup", PlayOnStartupCheckbox.state)
    }
    
    @IBAction func hideOnStartupChanged(_ sender: NSButton) {
        setBoolDefaultFromControlState("HideOnStartup", HideOnStartupCheckbox.state)
    }
    
    @IBAction func playButtonClicked(_ sender: NSButton) {
        if soundPlayer != nil {
            if soundPlayer!.stop() {
                sender.title = "Play silence"
                nowPlayingLabel.stringValue = "- - -"
                return
            }
        }
        else {
            soundPlayer = SoundPlayer()
        }
        soundPlayer!.playSound(file: "silence", ext: "mp3")
        sender.title = "Stop it"
        nowPlayingLabel.stringValue = "Now playing silence"
    }
    
    private func getControlStateFromBoolDefault(_ keyName: String) -> NSControl.StateValue! {
        return UserDefaults.standard.bool(forKey: keyName) ? NSControl.StateValue.on : NSControl.StateValue.off
    }
    
    private func setBoolDefaultFromControlState(_ keyName: String, _ stateValue: NSControl.StateValue) {
        UserDefaults.standard.set(stateValue == NSControl.StateValue.on, forKey: keyName)
    }
}

