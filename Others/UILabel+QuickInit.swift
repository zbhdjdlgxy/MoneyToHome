//
//  UILabel+QuickInit.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/16.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import Foundation

extension UILabel {
    
    class func quickInit(text : String,textColor : UIColor,font : UIFont,textAlignment : NSTextAlignment) -> UILabel {
        
        let label : UILabel = UILabel.init()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        return label
    }
}
