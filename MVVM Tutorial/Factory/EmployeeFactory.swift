//
//  EmployeeFactory.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import Foundation

class EmployeeFactory {
    static func maleEmployee() -> Employee {
        return Employee(id: 1, firstName: "Max", lastName: "Arnold", address: "U.S.A", gender: .Male)
    }
    
    static func femaleEmployee() -> Employee {
        return Employee(id: 1, firstName: "Jenifer", lastName: "Lawrence", address: "UK", gender: .Female)
    }
}