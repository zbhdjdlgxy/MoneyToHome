//
//  ZBTabBar.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/9.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit
protocol ZBTabBarDelegate {
    
    func tabBar(_ tabBar : ZBTabBar, selectBtnFrom : Int,to : Int)
    func tabBarLogStatus(_ tabBar : ZBTabBar, selectBtnFrom : Int,to : Int)
}



class ZBTabBar: UIView{

    var tabBarButtons : Array<TabBarBtn> = Array()
    

    var selectedButton : TabBarBtn = TabBarBtn()
    var delegate: ZBTabBarDelegate?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        // 调整加号按钮的位置
        let h : CGFloat = self.frame.size.height;
        let w : CGFloat = self.frame.size.width;
        // 按钮的frame数据
        let buttonH : CGFloat = h
        let buttonW : CGFloat = w / (CGFloat)(self.subviews.count)
        let buttonY : CGFloat = 0
        for index in 0..<self.tabBarButtons.count {
            // 1.取出按钮
            let button : TabBarBtn = self.tabBarButtons[index]
            // 2.设置按钮的frame
            let buttonX : CGFloat = (CGFloat)(index) * buttonW
            
            if index == 2 {
                //中间购物车突出
                let y = buttonY - 8
                let h = self.frame.size.height + 25
                button.frame = CGRect(x: buttonX, y: y, width: buttonW, height: h)
            }else{
                button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            }
            
            // 3.绑定tag
            button.tag = index
        }
    }
    
    
    func addTabBarButtonWithItem(_ item : UITabBarItem){
        // 1.创建按钮
        let button : TabBarBtn = TabBarBtn()
        self.addSubview(button)
        // 添加按钮到数组中
        self.tabBarButtons.append(button)
        // 2.设置数据
        button.item = item;
        
        // 3.监听按钮点击
        button.addTarget(self, action: #selector(self.buttonClick(_:)), for: .touchUpInside)
        
        // 4.默认选中第0个按钮
        if (self.tabBarButtons.count == 1) {
            self.buttonClick(button)
        }
    }

    func buttonClick(_ button : TabBarBtn){
        
        self.selectedButton.isSelected = false
        // 2.设置按钮的状态
        button.isSelected = true;
        self.selectedButton = button;
        if button.tag == 2 || button.tag == 4 {
            
             self.delegate?.tabBarLogStatus(self, selectBtnFrom:self.selectedButton.tag,to:button.tag)
            
        }else{
            // 1.通知代理
            self.delegate?.tabBar(self, selectBtnFrom:self.selectedButton.tag,to:button.tag)
            
        }
        
        
        
    }
}
