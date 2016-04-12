//
//  Interest.swift
//  swift_learning
//
//  Created by 张成龙 on 16/3/31.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit

struct Interest {
    
    var title = ""
    
    var description = ""
    
    var featuredImage: UIImage!
    
    var numberOfMembers = 0
    
    var numberOfPosts = 0
    
    init(title:String, description:String, image:UIImage, numberOfMembers:Int, numberOfPosts:Int) {
        self.title = title
        self.description = description
        self.featuredImage = image
        self.numberOfMembers = numberOfMembers
        self.numberOfPosts = numberOfPosts
    }
    
    init(title:String, description:String, image:UIImage) {
        self.init(title: title, description: description, image: image, numberOfMembers: 1, numberOfPosts: 1)
    }
}