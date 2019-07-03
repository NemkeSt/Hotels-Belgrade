//
//  UILabel.swift
//  TNation Zadatak
//
//  Created by Mac on 4/4/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit


extension UILabel {
    var optimalHeight : CGFloat {
        get
        {
            let opis = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            opis.numberOfLines = 0
            opis.lineBreakMode = NSLineBreakMode.byWordWrapping
            opis.font = self.font
            opis.text = self.text
            opis.sizeToFit()
            return opis.frame.height
        }
        
    }
}
