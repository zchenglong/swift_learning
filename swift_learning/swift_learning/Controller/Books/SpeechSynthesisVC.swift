//
//  SpeechSynthesisVC.swift
//  swift_learning
//
//  Created by 张成龙 on 16/4/5.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

/*
 主要学习语音合成
 1.AVSpeechSynthesizer合成器
 2.AVSpeechUtterance资源处理包括文本、音速、音量、音高等
 */
import UIKit
import AVFoundation

class SpeechSynthesisVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var rate: UISlider!
    @IBOutlet weak var pitch: UISlider!
    @IBOutlet weak var volume: UISlider!
    
    var synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rate.minimumValue = AVSpeechUtteranceMinimumSpeechRate
        rate.maximumValue = AVSpeechUtteranceMaximumSpeechRate
        rate.value = AVSpeechUtteranceDefaultSpeechRate
        
        pitch.minimumValue = 0.5
        pitch.maximumValue = 2.0
        pitch.value = 1.0
        
        volume.minimumValue = 0.0
        volume.maximumValue = 1.0
        volume.value = 1.0
    }

    @IBAction func play(sender: AnyObject) {
        utterance = AVSpeechUtterance(string: textField.text!)
        utterance!.rate = rate.value
        utterance!.pitchMultiplier = pitch.value
        utterance!.volume = volume.value
        
        if synthesizer.paused {
            synthesizer.continueSpeaking()
        } else {
            synthesizer.speakUtterance(utterance!)
        }
    }
    @IBAction func pause(sender: AnyObject) {
        synthesizer.pauseSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }
    
    @IBAction func rateAction(sender: AnyObject) {
        if utterance != nil{
            utterance!.rate = rate.value
        }
       
    }
    
    @IBAction func pitchAction(sender: AnyObject) {
        if utterance != nil {
            utterance!.pitchMultiplier = pitch.value
        }
    }
    
    @IBAction func volumeAvtion(sender: AnyObject) {
        if utterance != nil{
            utterance!.volume = volume.value
        }
    }
    
    
}
