//
//  RoundImage.swift
//  Social
//
//  Created by Karthik Varma on 6/15/17.
//  Copyright © 2017 Karthik. All rights reserved.
//

import UIKit

class RoundImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: kShadowGray, green: kShadowGray, blue: kShadowGray, alpha: kShadowGray).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 1, height: 1)
        self.contentMode = .scaleAspectFit
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }

}
