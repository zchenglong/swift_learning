//
//  SwiftDemoTableVC.swift
//  GithubOpen_swift
//
//  Created by 张成龙 on 16/3/29.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit

class DemosVC: UITableViewController {
    
    lazy var datas:[ListData] = {
        var temDemos = [ListData]()
        temDemos.append(ListData(id: "watch", name: NSLocalizedString("DEMOS_WATCH", comment: "")))
        temDemos.append(ListData(id: "font", name: NSLocalizedString("DEMOS_FONTS", comment: "")))
        temDemos.append(ListData(id: "video", name: NSLocalizedString("DEMOS_VIDEO", comment: "")))
        temDemos.append(ListData(id: "camera", name: NSLocalizedString("DEMOS_CAMERA", comment: "")))
        temDemos.append(ListData(id: "effect", name: NSLocalizedString("DEMOS_EFFECT", comment: "")))
        temDemos.append(ListData(id: "location", name: NSLocalizedString("DEMOS_LOCATION", comment: "")))
        return temDemos
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DemosVC {
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("demo", forIndexPath: indexPath)
        
        cell.textLabel!.text = datas[indexPath.row].name
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc = UIStoryboard(name: "Demos", bundle: nil).instantiateViewControllerWithIdentifier(datas[indexPath.row].id)
        vc.title = datas[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
