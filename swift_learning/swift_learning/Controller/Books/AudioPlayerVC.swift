//
//  AudioPlayerVC.swift
//  swift_learning
//
//  Created by 张成龙 on 16/4/5.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

/*
 主要学习AVAudioPlayer的使用
 2.CAGradientLayer的使用，渐变层
 */
import UIKit
import AVFoundation

class AudioPlayerVC: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var panLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    
    var timer: NSTimer!
    
    var gradientLayer = CAGradientLayer()
    
    var times:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSBundle.mainBundle().URLForResource("BIGBANG - Let's not fall in love", withExtension: "mp3")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url!)
        } catch {
            print("audioPlayer Error!")
        }
        
        slider.minimumValue = 0.0
        slider.maximumValue = (Float)(audioPlayer.duration)
        
        volumeSlider.minimumValue = 0.0
        volumeSlider.maximumValue = 1.0
        
        panLabel.text = String("\(audioPlayer.pan)")
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(sliderChange), userInfo: nil, repeats: true)
        timer.fire()
        
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).CGColor as CGColorRef
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).CGColor as CGColorRef
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).CGColor as CGColorRef
        let color5 = UIColor(white: 0.4, alpha: 0.2).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.9]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 1)
        self.view.layer.addSublayer(gradientLayer)
        
        self.randomBackgroundColor()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    func sliderChange() {
        slider.value = (Float)(audioPlayer.currentTime)
        panLabel.text = String("\(audioPlayer.pan)")
        
        if times % 2 == 0 && audioPlayer.playing {
            self.randomBackgroundColor()
        }
        times = times + 1
        
    }

    @IBAction func play(sender: AnyObject) {
        audioPlayer.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        audioPlayer.pause()
    }

    @IBAction func sliderAction(sender: AnyObject) {
        audioPlayer.currentTime = (Double)(slider.value)
    }
    @IBAction func volumeSliderAction(sender: AnyObject) {
        audioPlayer.volume = volumeSlider.value
    }
    
    func randomBackgroundColor() {
//        if audioPlayer.playing {
            let redValue = CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            let blueValue = CGFloat(drand48())
            
            self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
//        }
    }
}

extension AudioPlayerVC: AVAudioPlayerDelegate {

}
