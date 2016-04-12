//
//  MinesVC.swift
//  swift_learning
//
//  Created by 张成龙 on 16/4/5.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit

class MinesVC: UITableViewController {

    lazy var datas:[ListData] = [ListData(id: "lookinfo", name: NSLocalizedString("MINES_LOOKINFO", comment: ""))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MinesVC {
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.datas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mine", forIndexPath: indexPath)
        
        cell.textLabel!.text = datas[indexPath.row].name
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc = UIStoryboard(name: "Mines", bundle: nil).instantiateViewControllerWithIdentifier(datas[indexPath.row].id)
        vc.title = datas[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
