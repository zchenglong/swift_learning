//
//  HomeVC.swift
//  GithubOpen_swift
//
//  Created by 张成龙 on 16/3/22.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit

class HomeVC: UITabBarController {

    @IBOutlet weak var myTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.setNavigationItem((myTabBar.selectedItem?.tag)!)
    }

}

//MARK:私有函数
extension HomeVC {
    
    func setNavigationItem(tag:Int) {
        switch tag {
        case 0:
            self.navigationItem.title = NSLocalizedString("NAV_TITLE_EXAMPLE", comment: "")
        case 1:
            self.navigationItem.title = NSLocalizedString("NAV_TITLE_BOOK", comment: "")
        case 2:
            self.navigationItem.title = NSLocalizedString("NAV_TITLE_APPLE", comment: "")
        case 3:
            self.navigationItem.title = NSLocalizedString("NAV_TITLE_MINE", comment: "")
        default:
            break
            
        }
    }
}

//MARK:TabView协议
extension HomeVC {
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.setNavigationItem(item.tag)
    }
}

//MARK:列表数据
struct ListData {
    var id:String!
    var name:String!
    
    init(id:String, name:String) {
        self.id = id
        self.name = name
    }
}
