//
//  CameraVC.swift
//  GithubOpen_swift
//
//  Created by 张成龙 on 16/3/30.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

/*
    1.AVCaptureSession 
    2.AVCaptureVideoPreviewLayer
    3.AVCaptureStillImageOutput
 */

import UIKit
import AVFoundation

class CameraVC: UIViewController {
    
    @IBOutlet weak var cameraView: UIView!
    
    @IBOutlet weak var tempImageV: UIImageView!

    var captureSession:AVCaptureSession?
    
    var captureStillImageOutput:AVCaptureStillImageOutput?
    
    var captureVideoPreviewLayer:AVCaptureVideoPreviewLayer?
    
    var didTakePhoto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTakePhotoStatus()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        startCamera()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        captureVideoPreviewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.captureSession?.stopRunning()
    }
    
    func startCamera() {
        //创建Session
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        //设置Input
        var error:NSError?
        var input:AVCaptureDeviceInput?
        
        do {
            input = try AVCaptureDeviceInput(device: captureDevice)
        } catch let e as NSError {
            error = e
            input = nil
        }
        
        if error == nil && captureSession?.canAddInput(input) != nil {
            captureSession?.addInput(input)
            
            //设置Output
            captureStillImageOutput = AVCaptureStillImageOutput()
            captureStillImageOutput?.outputSettings = [AVVideoCodecKey:AVVideoCodecJPEG]
            
            if captureSession?.canAddOutput(captureStillImageOutput) != nil {
                captureSession?.addOutput(captureStillImageOutput)
                
                //添加布局
                captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session:captureSession)
                captureVideoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                captureVideoPreviewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                cameraView.layer.addSublayer(captureVideoPreviewLayer!)
                
                //开始捕捉
                captureSession?.startRunning()
                
            }
        }
    }
    
    func stopCamera() {
        if let videoConnection = captureStillImageOutput?.connectionWithMediaType(AVMediaTypeVideo) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            captureStillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: { (sampleBuffer, error) in
                
                if sampleBuffer != nil {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    
                    let dataProvider = CGDataProviderCreateWithCFData(imageData)
                    
                    let cgImagRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                    
                    let image = UIImage(CGImage: cgImagRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                    
                    self.tempImageV.image = image
                    
//                    self.tempImageV.hidden = false
                    
//                    self.captureSession?.stopRunning()
                    
                }
            })
        }
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        didPressTakeAnother()
    }
    
    func didPressTakeAnother() {
        if didTakePhoto {
            didTakePhoto = false
//            startCamera()
        } else {
            didTakePhoto = true
            stopCamera()
        }
        
        updateTakePhotoStatus()
    }

    func updateTakePhotoStatus() {
        if didTakePhoto {
            self.tempImageV.hidden = false
        } else {
            self.tempImageV.hidden = true
        }
    }
}











