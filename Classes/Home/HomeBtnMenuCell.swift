//
//  HomeBtnMenuCell.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/25.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class HomeBtnMenuCell: UITableViewCell {

    var menu : MenuView?
    
    var DataList : Array<HomeBtnItem>{
        
        willSet{
            
            var menus = [(String,String)]()
            for item in newValue{
                
                menus.append((item.ButtonTitle!,item.ButtonImage!))
            }
            menu?.defaultRowOfNumber = 5
            menu?.menus = menus
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){

        DataList = [HomeBtnItem]()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.menu = MenuView.init(frame: .zero)
        self.addSubview(self.menu!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.menu?.frame = self.bounds
        
    }

}
