//
//  Employee.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import Foundation

enum Gender: Int {
    case Male = 0
    case Female
}

class Employee: NSObject {
    var employeeID: Int!
    var firstName: String!
    var lastName: String!
    var address: String!
    var gender: Gender!
    
    init(id: Int, firstName: String, lastName: String, address: String, gender: Gender) {
        super.init()
        self.employeeID = id
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.gender = gender
    }
}