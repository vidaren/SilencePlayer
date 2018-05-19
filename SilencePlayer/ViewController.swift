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
        PlayOnStartupCheckbox.state = getControlStateFromBoolDefault(keyName: "PlayOnStartup")
        HideOnStartupCheckbox.state = getControlStateFromBoolDefault(keyName: "HideOnStartup")
        if (PlayOnStartupCheckbox.state == NSControl.StateValue.on) {
            playButtonClicked(PlayButton)
        }
        if (HideOnStartupCheckbox.state == NSControl.StateValue.on) {
            NSApplication.shared.hide(nil)
        }
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func playOnStartupChanged(_ sender: NSButton) {
        setBoolDefaultFromControlState(keyName: "PlayOnStartup", stateValue: PlayOnStartupCheckbox.state)
    }
    
    @IBAction func hideOnStartupChanged(_ sender: NSButton) {
        setBoolDefaultFromControlState(keyName: "HideOnStartup", stateValue: HideOnStartupCheckbox.state)
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
    
    private func getControlStateFromBoolDefault(keyName: String) -> NSControl.StateValue! {
        return UserDefaults.standard.bool(forKey: keyName) ? NSControl.StateValue.on : NSControl.StateValue.off
    }
    
    private func setBoolDefaultFromControlState(keyName: String, stateValue: NSControl.StateValue) {
        UserDefaults.standard.set(stateValue == NSControl.StateValue.on, forKey: keyName)
    }
}

