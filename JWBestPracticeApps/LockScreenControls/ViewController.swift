//
//  ViewController.swift
//  LockScreenControls
//
//  Created by Michael Salvador on 5/20/20.
//  Copyright © 2020 Karim Mourra. All rights reserved.
//

import UIKit

let videoUrl = "http://playertest.longtailvideo.com/adaptive/oceans/oceans.m3u8"

class ViewController: JWBasicVideoViewController {

    var player2: JWPlayerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        createSecondPlayer()

        // After all players have been instantiated, make sure 'displayLockScreenControls' is set to false for all the players
        // you don't want to be affected by lock screen controls. Then, set 'displayLockScreenControls' true
        // for the player you do want the lock screen controls to affect.

        player2?.displayLockScreenControls = false // Won't be affected by lock screen controls
        player.displayLockScreenControls = true // Will be affected by lock screen controls

        // Note: - If a third player is instantiated, it will take over the current lock screen controls,
        // because 'displayLockScreenControls' defaults to true.
    }

    func createSecondPlayer() {
        let config = JWConfig.init(contentUrl: videoUrl)
        config.autostart = true
        self.player2 = JWPlayerController(config: config)
    }
}

