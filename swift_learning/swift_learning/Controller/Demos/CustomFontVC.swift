//
//  CustomFont.swift
//  GithubOpen_swift
//
//  Created by 张成龙 on 16/3/29.
//  Copyright © 2016年 Skyworth. All rights reserved.
//

/*
 重点：1.TTF字体资源文件已定要有
    2.在info.plist文件中加入Fonts provided by application项
    3.TableView中在Storyboard下建立的Cell需要ReuseIdentifier来找到
 */

import UIKit

class CustomFontVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var fonts:[String] = {
        var tempFonts = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
        return tempFonts
        
    }()
    
    lazy var datas:[String] = {
        var tempDatas = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉"]
        return tempDatas
    }()
    
    var fontIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family){
                print(font)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeFont(sender: AnyObject) {
        fontIndex = (fontIndex + 1) % 3
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("FontCell")!
        
        let text = datas[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.redColor()
        cell.textLabel?.font = UIFont(name: self.fonts[fontIndex], size: 16)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
