//
//  PlayerController.swift
//  GithubOpen_swift
//
//  Created by 张成龙 on 16/3/28.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MoviePlayerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "videoSegue" {
            let videoURL = NSBundle.mainBundle().URLForResource("TestVideo", withExtension: "m4v")
            let videoViewController = segue.destinationViewController as! AVPlayerViewController
            videoViewController.player = AVPlayer(URL: videoURL!)
            
            
        }
    }

}
