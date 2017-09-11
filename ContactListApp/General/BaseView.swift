//
//  BaseView.swift
//  ContactListApp
//
//  Created by Ashley Han on 5/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
