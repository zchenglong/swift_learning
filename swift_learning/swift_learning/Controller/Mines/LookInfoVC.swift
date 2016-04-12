//
//  LookInfoVC.swift
//  swift_learning
//
//  Created by 张成龙 on 16/4/5.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit

struct DeviceInfo {
    
    var currentDevice:UIDevice {
        return UIDevice.currentDevice()
    }
    
    var deviceName:String {
        return currentDevice.name
    }
    
    var deviceUUID:String {
        return (currentDevice.identifierForVendor?.UUIDString)!
    }
    
    var systemName:String {
        return currentDevice.systemName
    }
    
    var systemVersion:String {
        return currentDevice.systemVersion
    }
    
    var deviceModel:String {
        return currentDevice.model
    }
    
    var deviceLocalModel:String {
        return currentDevice.localizedModel
    }
    
    var deviceBettery:Float {
        return currentDevice.batteryLevel
    }
    
}

struct BundleInfo {
    
}

struct LocaleInfo {
    var languageArray:[String] {
        return NSLocale.preferredLanguages()
    }
    var language:String {
        return languageArray[0]
    }
    var country:String {
        return NSLocale.currentLocale().localeIdentifier
    }
}

class LookInfoVC: UIViewController {

    @IBOutlet weak var showLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let device = DeviceInfo()
        let language = LocaleInfo()
        let info:String = String()
        
        showLabel.text = info.stringByAppendingFormat("name:\(device.deviceName)\nUUID:\(device.deviceUUID)\nsystemName:\(device.systemName)\nsystemVersion:\(device.systemVersion)\ndeviceModel:\(device.deviceModel)\ndeviceLocalModel:\(device.deviceLocalModel)\nbettery:\(device.deviceBettery)\nlanguage:\(language.language)\ncountry:\(language.country)")
        
        
        
    }

}
