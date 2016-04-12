//
//  CarouselEffectVC.swift
//  swift_learning
//
//  Created by 张成龙 on 16/3/31.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

/*
 重点：1.模糊特效Visual Effect View的使用（蒙板）
    2.在CollectionViewCell中didSet的使用，简化了代码逻辑
    3.通过Storyboard设置dataSource和delegate
 */

import UIKit

class CarouselEffectVC: UIViewController {

    @IBOutlet weak var backgroudImageV: UIImageView!
    @IBOutlet weak var collectionV: UICollectionView!
    
    var datas:[Interest] = [
        Interest(title: "Hello there, i miss u.", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "hello")!),
        Interest(title: "🐳🐳🐳🐳🐳", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "dudu")!),
        Interest(title: "Training like this, #bodyline", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "bodyline")!),
        Interest(title: "I'm hungry, indeed.", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "wave")!),
        Interest(title: "Dark Varder, #emoji", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "darkvarder")!),
        Interest(title: "I have no idea, bitch", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "hhhhh")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroudImageV.image = UIImage(named: "blue")
        
//        collectionV.dataSource = self
    }
    
}

extension CarouselEffectVC : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("interestCell", forIndexPath: indexPath) as! InterestCollectionCell
        
        cell.interest = datas[indexPath.row]
        
        return cell
    }
}
