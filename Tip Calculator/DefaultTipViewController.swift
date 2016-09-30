//
//  DefaultTipViewController.swift
//  Tip Calculator
//
//  Created by Kalpathy Mohan, Shriram on 9/30/16.
//  Copyright © 2016 Kalpathy Mohan, Shriram. All rights reserved.
//

import Foundation

//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kalpathy Mohan, Shriram on 9/25/16.
//  Copyright © 2016 Kalpathy Mohan, Shriram. All rights reserved.
//

import UIKit

class DefaultTipViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    weak var tableView : UITableView!
    var defaultTips:[String:Int] = ["10 %":10, "15 %":15, "20 %":20]
    var defaultTipkeys:[String] = []
    var selectedDefaultTip:Int = 15
    var delegate:ViewController = ViewController()
    
    override func viewDidLoad() {
        self.view = UITableView(frame: CGRectZero, style: .Plain)
        self.delegate = navigationController?.viewControllers.first as! ViewController
        self.tableView = self.view as! UITableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        defaultTipkeys = Array(defaultTips.keys).sort()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = defaultTipkeys[indexPath.row]
        if indexPath.row == self.delegate.selectedDefaultTipRow {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedDefaultTip = defaultTips[defaultTipkeys[indexPath.row]]!
        self.delegate.defaultTip = selectedDefaultTip
        navigationController?.popToRootViewControllerAnimated(true)
        self.delegate.selectedDefaultTipRow = indexPath.row
    }
}
