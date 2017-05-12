//
//  LeftWordTF.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/4.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class LeftWordTF: UITextField {

    var titleLabel : UILabel = UILabel.init()
    
    public var title : NSString{
        
        willSet {
            
            titleLabel.text = newValue as String
        }
    }
    
    override init(frame: CGRect) {
        
        title = ""
        super.init(frame: frame)
        self.leftView = self.titleLabel
        self.leftViewMode = .always
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
       super.layoutSubviews()

        titleLabel.bounds = CGRect(x: 0, y: 0, width: 100, height: 30)
    }
    
    

}
