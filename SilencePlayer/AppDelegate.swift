//
//  AppDelegate.swift
//  SilencePlayer
//
//  Created by Vidar on 13.04.2018.
//  Copyright © 2018 Vidar Tysse. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        UserDefaults.standard.register(defaults: [
            "PlayOnStartup" : false,
            "HideOnStartup" : false
        ])
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

