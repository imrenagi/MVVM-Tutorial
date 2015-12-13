//
//  ReactiveView.swift
//  MVVM Tutorial
//
//  Created by Imre Nagi on 12/13/15.
//  Copyright (c) 2015 Imre Nagi. All rights reserved.
//

import Foundation

protocol ReactiveView {
    func bindViewModel(viewModel: AnyObject)
}