//
//  InterestCollectionCell.swift
//  swift_learning
//
//  Created by 张成龙 on 16/3/31.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit

class InterestCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var featureImageV: UIImageView!
    
    @IBOutlet weak var featureLabel: UILabel!
    
    var interest: Interest! {
        didSet {
            featureImageV.image = interest.featuredImage
            featureLabel.text = interest.title
        }
    }
    
}
