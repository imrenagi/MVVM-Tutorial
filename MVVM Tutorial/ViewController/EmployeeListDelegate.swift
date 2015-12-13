//
//  EmployeeListDelegate.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import Foundation

class EmployeeListDelegate: NSObject, UITableViewDelegate {
    
    var tableView: UITableView!
    var didSelectCellCommand: RACCommand!

    init(tableView: UITableView, cellCommand: RACCommand) {
        super.init()
        self.tableView = tableView
        self.didSelectCellCommand = cellCommand
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.didSelectCellCommand.execute(indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}