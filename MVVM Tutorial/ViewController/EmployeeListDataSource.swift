//
//  EmployeeListDataSource.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import Foundation

class EmployeeListDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier = "EmployeeItemCell"
    
    var tableView: UITableView!
    var cellModel: [EmployeeItemCellModel]?
    
    init(tableView: UITableView, dataSignal: RACSignal) {
        super.init()
        self.tableView = tableView
        dataSignal.subscribeNext { (obj:AnyObject!) -> Void in
            if let data = obj as? [EmployeeItemCellModel] {
                self.cellModel = data
                self.tableView.reloadData()
            }
        }
        self.tableView.dataSource = self
        
        var nib = UINib(nibName: cellIdentifier, bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: EmployeeItemCell! = self.tableView!.dequeueReusableCellWithIdentifier(cellIdentifier) as? EmployeeItemCell
        cell.bindViewModel(cellModel![indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let counter = self.cellModel?.count {
            return counter
        }
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}