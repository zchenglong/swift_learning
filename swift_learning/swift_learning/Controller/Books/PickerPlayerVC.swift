//
//  PickerPlayerVC.swift
//  swift_learning
//
//  Created by 张成龙 on 16/4/6.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

/*
 重点：1.学习UIImagePickerController的使用
    2.需要导入framework:MobileCoreServices
    3.picker的sourceType,MediaType的含义
    4.代理中函数的作用以及判断MediaType区分数据来源
 */

import UIKit
import MobileCoreServices

class PickerPlayerVC: UIViewController {

    @IBOutlet weak var imgPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func takePhoto(sender: AnyObject) {
        let picker = UIImagePickerController()
        let sourceType = UIImagePickerControllerSourceType.Camera
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            picker.sourceType = sourceType
//            picker.mediaTypes = NSArray.init(array: [kUTTypeImage as NSString, kUTTypeVideo as NSString]) as! [String]
            
            let fontCamera = UIImagePickerControllerCameraDevice.Front
            let rearCamera = UIImagePickerControllerCameraDevice.Rear
            if UIImagePickerController.isCameraDeviceAvailable(fontCamera) {
                picker.cameraDevice = fontCamera
            } else {
                picker.cameraDevice = rearCamera
            }
            picker.delegate = self
//            picker.allowsEditing = true
            
            self.presentViewController(picker, animated: true, completion: { 
                
            })
            
        }
        
    }
    
    @IBAction func loadPhotoLibrary(sender: AnyObject) {
        let picker = UIImagePickerController()
        let sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            picker.sourceType = sourceType
            picker.delegate = self
//            picker.allowsEditing = true
            self.presentViewController(picker, animated: true, completion: {
                
            })
  
        }
        
        
    }
    
    @IBAction func loadAlbum(sender: AnyObject) {
        let picker = UIImagePickerController()
        let sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            picker.sourceType = sourceType
            picker.delegate = self
//            picker.allowsEditing = true
            self.presentViewController(picker, animated: true, completion: {
                
            })
            
        }
    }
}

extension PickerPlayerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true) {
            
        }
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType]
        if ((mediaType?.isEqualToString(kUTTypeImage as NSString as String)) != nil)  {
            let image:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
//            let imageEdit:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            self.imgPhoto.image = image
        }
        
        
        self.dismissViewControllerAnimated(true) {
            
        }
    }
}
