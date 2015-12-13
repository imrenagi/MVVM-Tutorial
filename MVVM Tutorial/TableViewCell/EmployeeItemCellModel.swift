//
//  EmployeeItemCellModel.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import Foundation

class EmployeeItemCellModel: NSObject {
    
    var name: String!
    var address: String!
    var imageName: String!
    var pickCommand: RACCommand!
    
    init(employee: Employee) {
        super.init()
        self.name = employee.firstName + " " + employee.lastName
        self.address = employee.address
        if employee.gender == Gender.Male {
            self.imageName = "male"
        } else {
            self.imageName = "female"
        }
        self.initPickCommand()
    }
    
    private func initPickCommand() {
        self.pickCommand = RACCommand(signalBlock: { (obj:AnyObject!) -> RACSignal! in
            return RACSignal.createSignal({ (subscriber:RACSubscriber!) -> RACDisposable! in
                subscriber.sendNext(self.name)
                subscriber.sendCompleted()
                return nil
            })
        })
    }
    
}