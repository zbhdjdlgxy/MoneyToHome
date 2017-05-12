//
//  MeMyOrderCell.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/12.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class MeMyOrderCell: UITableViewCell {

    var orderMenuView :MenuView?
    
    var menus :[(String,String)]{
        
        willSet{
            
            orderMenuView?.menus = newValue
        }
    }

    var borderLine : Bool{
        
        willSet{
            
           orderMenuView?.borderLine = newValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        self.menus = Array<(String,String)>.init()
        self.borderLine = false
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.orderMenuView = MenuView.init(frame: .zero)
        self.addSubview(orderMenuView!)
        
    }
    
    override func layoutSubviews() {
        
        orderMenuView?.frame = self.bounds
    }

}
