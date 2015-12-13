//
//  EmployeeListViewModel.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import Foundation

class EmployeeListViewModel: NSObject {
    
    dynamic var cellModel: [EmployeeItemCellModel]?
    var selectedCellCommand: RACCommand!
    
    private lazy var changeVCTitleSubject: RACSubject = RACSubject()
    var changeTitleSignal: RACSignal {
        get { return changeVCTitleSubject }
    }
    
    override init() {
        super.init()
        self.initSelectedCellCommand()
    }
    
    private func initSelectedCellCommand() {
        self.selectedCellCommand = RACCommand(signalBlock: { (data:AnyObject!) -> RACSignal! in
            return RACSignal.createSignal({ (subscriber:RACSubscriber!) -> RACDisposable! in
                subscriber.sendNext(data)
                subscriber.sendCompleted()
                return nil
            })
        })
    }
    
    func loadEmployee() {
        self.loadEmployeeSignal().subscribeNext { (obj:AnyObject!) -> Void in
            if let cellModel = obj as? [EmployeeItemCellModel] {
                self.cellModel = cellModel
            }
        }
    }
    
    private func loadEmployeeSignal() -> RACSignal {
        return RACSignal.createSignal({ (subscriber:RACSubscriber!) -> RACDisposable! in
            subscriber.sendNext(self.createCellModel(self.dummyEmployees()))
            subscriber.sendCompleted()
            return nil
        }).delay(3.0)
    }
    
    private func dummyEmployees() -> [Employee] {
        var employees: [Employee] = [Employee]()
        employees.append(EmployeeFactory.maleEmployee())
        employees.append(EmployeeFactory.femaleEmployee())
        employees.append(EmployeeFactory.maleEmployee())
        employees.append(EmployeeFactory.femaleEmployee())
        employees.append(EmployeeFactory.maleEmployee())
        employees.append(EmployeeFactory.femaleEmployee())
        return employees
    }
    
    private func createCellModel(employees: [Employee]) -> [EmployeeItemCellModel] {
        return employees.map(self.employeeToCellModel)
    }
    
    private func employeeToCellModel(employee: Employee) -> EmployeeItemCellModel {
        let cellModel = EmployeeItemCellModel(employee: employee)
        cellModel.pickCommand.executionSignals.flatten().subscribeNext { (data:AnyObject!) -> Void in
            if let name = data as? String {
                self.changeVCTitleSubject.sendNext(name)
            }
        }
        return cellModel
    }
}