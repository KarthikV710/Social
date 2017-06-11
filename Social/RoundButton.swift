//
//  RoundButton.swift
//  Social
//
//  Created by Karthik Varma on 6/11/17.
//  Copyright © 2017 Karthik. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
}
