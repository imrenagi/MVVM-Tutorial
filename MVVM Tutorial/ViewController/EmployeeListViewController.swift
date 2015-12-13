//
//  EmployeeListViewController.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import UIKit

class EmployeeListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource : EmployeeListDataSource!
    var delegate: EmployeeListDelegate!
    
    var viewModel: EmployeeListViewModel!
    
    init(viewModel: EmployeeListViewModel) {
        super.init(nibName: "EmployeeListViewController", bundle: nil)
        self.viewModel = viewModel
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.observeSignalFromViewModel()
        self.observeSelectedCellSignal()
        self.setupTableView()
        self.viewModel.loadEmployee()
    }
    
    private func setupTableView() {
        self.dataSource = EmployeeListDataSource(tableView: self.tableView, dataSignal: RACObserve(self.viewModel, "cellModel"))
        self.delegate = EmployeeListDelegate(tableView: self.tableView, cellCommand: self.viewModel.selectedCellCommand)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
    }
    
    private func observeSignalFromViewModel() {
        self.viewModel.changeTitleSignal.subscribeNext { (name:AnyObject!) -> Void in
            println(name)
            self.title = name as? String
        }
    }
    
    private func observeSelectedCellSignal() {
        self.viewModel.selectedCellCommand.executionSignals.flatten().subscribeNext { (data:AnyObject!) -> Void in
            println(data)
        }
    }
}
