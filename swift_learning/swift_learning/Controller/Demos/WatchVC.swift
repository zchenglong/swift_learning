//
//  WatchVC.swift
//  GithubOpen_swift
//
//  Created by 张成龙 on 16/3/29.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

/*
 重点：1.建立独立的Storyboard并且能够找到，push的时候通过StoryboardId找到ViewController
    2.NSTimer的使用
 */

import UIKit

class WatchVC: UIViewController {

    @IBOutlet weak var showLabel: UILabel!
    
    var timer:NSTimer? = NSTimer()
    
    var counter = 0.0
    
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLabel.text = String(counter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startAction(sender: AnyObject) {
        if isPlaying {
            return
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }

    @IBAction func stopAction(sender: AnyObject) {
        timer?.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetAction(sender: AnyObject) {
        timer?.invalidate()
        isPlaying = false
        counter = 0.0
        showLabel.text = String(format: "%.1f", counter)
    }
    
    func updateTimer() {
        counter = counter + 0.1
        showLabel.text = String(format: "%.1f", counter)
    }
    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//    }
 

}
