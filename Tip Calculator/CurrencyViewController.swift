//
//  CurrencyViewController.swift
//  Tip Calculator
//
//  Created by Kalpathy Mohan, Shriram on 9/29/16.
//  Copyright © 2016 Kalpathy Mohan, Shriram. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    weak var tableView : UITableView!
    var currencies:[String:String] = ["U.S. Dollar":"$", "U.K. Pound Sterling":"£", "Indian Rupee":"₹"]
    var currencykeys:[String] = []
    var selectedCurrency:String = ""
    var delegate:ViewController = ViewController()
    
    override func viewDidLoad() {
        self.view = UITableView(frame: CGRectZero, style: .Plain)
        self.delegate = navigationController?.viewControllers.first as! ViewController
        self.tableView = self.view as! UITableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        currencykeys = Array(currencies.keys)
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
        cell.textLabel?.text = currencykeys[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedCurrency = currencies[currencykeys[indexPath.row]]!
        self.delegate.clearCurrencySymbols()
        self.delegate.currencySymbol = selectedCurrency
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
