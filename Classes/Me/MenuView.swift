//
//  MyOrderView.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/11.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class MenuView: UIView {

    var menus :[(String,String)]{
        
        willSet{
            
            for index in 0..<newValue.count {
                
                let item = newValue[index]
                
                let titleIconView = TitleIconView.init(frame: .zero)
                titleIconView.title = item.0
                titleIconView.image = item.1
                titleIconView.tag = index
                self.addSubview(titleIconView)
            }
        }
    }
    
    var borderLine : Bool{
        
        willSet{
            
            for item in self.subviews {
                
                let titleIconView : TitleIconView = item as! TitleIconView
                titleIconView.borderLine = newValue
            }
        }
    }
    
    
    var defaultRowOfNumber  = 4
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemCount = self.menus.count
        var sectionNumber: Int?
        if itemCount % defaultRowOfNumber != 0 {
            
            sectionNumber = itemCount / defaultRowOfNumber + 1
        }else{
            sectionNumber = itemCount / defaultRowOfNumber
        }
        
        let itemW = self.frame.size.width / 4
        let itemH = self.frame.size.height / CGFloat(sectionNumber!)
        let subViewCount = self.subviews.count
        for index in 0..<subViewCount{
            
            let titleIconView : TitleIconView = self.subviews[index] as! TitleIconView
            let viewX = CGFloat(index % defaultRowOfNumber) * itemW
            let viewY = CGFloat(index / defaultRowOfNumber) * itemH
            titleIconView.frame = CGRect(x: viewX, y: viewY, width: itemW, height: itemH)
        }
        
    }
    
    override init(frame: CGRect){
        
        self.menus = Array<(String,String)>.init()
        self.borderLine = false
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
