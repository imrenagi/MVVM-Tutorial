//
//  EmployeeItemCell.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import UIKit

class EmployeeItemCell: UITableViewCell, ReactiveView {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var pickButton: UIButton!
    
    var viewModel: EmployeeItemCellModel!
    
    func bindViewModel(viewModel: AnyObject) {
        self.viewModel = viewModel as! EmployeeItemCellModel
        self.name.text = self.viewModel.name
        self.address.text = self.viewModel.address
        self.avatar.backgroundColor = self.imageColor(self.viewModel.imageName)
        self.pickButton.rac_command = self.viewModel.pickCommand
    }
    
    private func imageColor(imageName: String) -> UIColor {
        if imageName == "male" {
            return UIColor.redColor()
        } else {
            return UIColor.purpleColor()
        }
    }
    
}
