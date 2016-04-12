//
//  VideoCell.swift
//  GithubOpen_swift
//
//  Created by 张成龙 on 16/3/29.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit

struct Video {
    let image:String

}

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    
    @IBOutlet weak var playBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
