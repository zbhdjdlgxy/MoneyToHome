//
//  MeMyOrderCell.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/12.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

protocol MeMyOrderCellDelegate {
    
    func meMyOrderCellDidItemSelected(cell : MeMyOrderCell,selectItemIndex : Int)
}

class MeMyOrderCell: UITableViewCell, MenuViewDelegate{

    var orderMenuView :MenuView?
    
    var delegate : MeMyOrderCellDelegate?
    
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
        self.orderMenuView?.delegate = self
        self.addSubview(orderMenuView!)
        
    }
    
    override func layoutSubviews() {
        
        orderMenuView?.frame = self.bounds
    }

    //MARK:  MenuViewDelegate
    func menuViewDidItemSelected(menu : MenuView,selectItemIndex : Int){
        
        self.delegate?.meMyOrderCellDidItemSelected(cell: self, selectItemIndex: selectItemIndex)
    }
}
