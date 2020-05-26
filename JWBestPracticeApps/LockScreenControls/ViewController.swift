//
//  ViewController.swift
//  LockScreenControls
//
//  Created by Michael Salvador on 5/20/20.
//  Copyright © 2020 Karim Mourra. All rights reserved.
//

import UIKit

let videoUrl = "http://playertest.longtailvideo.com/adaptive/oceans/oceans.m3u8"

class ViewController: UIViewController {

    var topPlayer: JWPlayerController!
    var bottomPlayer: JWPlayerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        createTopPlayer()
        createBottomPlayer()

        // After all players have been instantiated, make sure 'displayLockScreenControls' is set to false for all the players
        // you don't want to be affected by lock screen controls. Then, set 'displayLockScreenControls' true
        // for the player you do want the lock screen controls to affect.

        bottomPlayer.displayLockScreenControls = false // Won't be affected by lock screen controls
        topPlayer.displayLockScreenControls = true // Will be affected by lock screen controls

        // Note: - If a third player is instantiated, it will take over the current lock screen controls,
        // because 'displayLockScreenControls' defaults to true.
    }

    func createTopPlayer() {
        let config = JWConfig.init(contentUrl: videoUrl)
        config.title = "Top Player"
        config.autostart = true
        config.size = CGSize(width: self.view.frame.size.width, height: self.view.frame.height/2)
        self.topPlayer = JWPlayerController(config: config)
        if let playerView = self.topPlayer.view {
            self.view.addSubview(playerView)
            playerView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY - (config.size.height/2))
        }
    }

    func createBottomPlayer() {
        let config = JWConfig.init(contentUrl: videoUrl)
        config.title = "Bottom Player"
        config.autostart = true
        config.size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        self.bottomPlayer = JWPlayerController(config: config)
        if let playerView = self.bottomPlayer.view {
            self.view.addSubview(playerView)
            playerView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY + (config.size.height/2))
        }
    }
}

