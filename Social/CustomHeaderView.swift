//
//  CustomHeaderView.swift
//  Social
//
//  Created by Karthik Varma on 6/11/17.
//  Copyright © 2017 Karthik. All rights reserved.
//

import UIKit

class CustomHeaderView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: shadowGray, green: shadowGray, blue: shadowGray, alpha: shadowGray).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 1, height: 1)
        
    }
}
