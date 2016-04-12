//
//  VideoVC.swift
//  GithubOpen_swift
//
//  Created by 张成龙 on 16/3/29.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

/*
 重点：1.自定义TableCell
    2.AVPlayer的使用 －－>AVFoundation
    3.AVPlayerViewController的使用 －－>AVKit
 */

import UIKit
import AVKit
import AVFoundation

class VideoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var videoTableView: UITableView!
    
    var datas = [
        Video(image:"videoScreenshot01"),
        Video(image:"videoScreenshot02"),
        Video(image:"videoScreenshot03"),
        Video(image:"videoScreenshot04"),
        Video(image:"videoScreenshot05"),
        Video(image:"videoScreenshot06"),
    ]
    
    var playerViewController = AVPlayerViewController()
    
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoTableView.dataSource = self
        videoTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCellWithIdentifier("VideoCell") as! VideoCell
        cell.imageView?.image = UIImage(named: datas[indexPath.row].image)
        
        cell.playBtn.addTarget(self, action: #selector(playClicked), forControlEvents: UIControlEvents.TouchUpInside)
        cell.contentView.bringSubviewToFront(cell.playBtn)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    func playClicked() {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        
        playerViewController.player = player
        
        self.presentViewController(playerViewController, animated: true) {
            self.playerViewController.player?.play()
        }
    }


}
