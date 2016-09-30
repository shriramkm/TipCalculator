//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kalpathy Mohan, Shriram on 9/25/16.
//  Copyright © 2016 Kalpathy Mohan, Shriram. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    weak var tableView : UITableView!
    var settingsOptions:[String] = ["Currency", "About"]
    var settingsViewControllers:[UIViewController] = [CurrencyViewController()]
    
    override func viewDidLoad() {
        self.view = UITableView(frame: CGRectZero, style: .Plain)
        self.tableView = self.view as! UITableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let versionViewController = storyboard.instantiateViewControllerWithIdentifier("versionViewController")
        self.settingsViewControllers += [versionViewController]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = settingsOptions[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(settingsViewControllers[indexPath.row], animated: true)
    }
}