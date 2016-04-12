//
//  BookDemoVC.swift
//  swift_learning
//
//  Created by 张成龙 on 16/3/30.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

import UIKit

class BooksVC: UITableViewController {
    
    lazy var datas:[ListData] = [ListData(id: "videoplayer", name: NSLocalizedString("BOOKS_VIDEOPLAYER", comment: "")),
                                 ListData(id: "audioplayer", name: NSLocalizedString("BOOKS_AUDIOPLAYER", comment: "")),
                                 ListData(id: "speech", name: NSLocalizedString("BOOKS_SPEEACH_SYNTHESIS", comment: "")),
                                 ListData(id: "picker", name: NSLocalizedString("BOOKS_PICKER", comment: ""))]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension BooksVC {
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.datas.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("book", forIndexPath: indexPath)
        
        cell.textLabel!.text = datas[indexPath.row].name
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc = UIStoryboard(name: "Books", bundle: nil).instantiateViewControllerWithIdentifier(datas[indexPath.row].id)
        vc.title = datas[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
