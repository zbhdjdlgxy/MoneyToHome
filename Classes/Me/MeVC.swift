//
//  MeVC.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/4.
//  Copyright © 2017年 szgyzb. All rights reserved.
//  我的

import UIKit

class MeVC: UITableViewController,MeMyOrderCellDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground
    
    }
    
    override init(style: UITableViewStyle) {
        
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: TableViewDataSource
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let identifier = "meCell"
        var cell : MeMyOrderCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as! MeMyOrderCell?
        if cell == nil {
            
            cell = MeMyOrderCell.init(style: .default, reuseIdentifier: identifier)
        }
        if indexPath.section == 0 {
            
            cell?.menus = [("待支付","order_wait_pay"),("待收货","order_wait_take"),("已完成","order_finish"),("已取消","order_cancel")]
            cell?.delegate = self
            cell?.borderLine = false
        }else if indexPath.section == 1 {
            
            cell?.menus = [("我的收藏","me_collect"),("充值有礼","me_recharge"),("个人信息","me_personal_msg"),("收货地址","me_addr"),("消息中心","me_msg_center"),("商品评论","me_comment"),("帮组反馈","me_feedback"),("联系客服","me_contact")]
            cell?.delegate = self
            cell?.borderLine = true
        }
        
        return cell!
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }else if indexPath.section == 1{
            return 160
        }
        return 0
        
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int{
        
        return 2
    }

    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //MARK:  MeMyOrderCellDelegate
    func meMyOrderCellDidItemSelected(cell : MeMyOrderCell,selectItemIndex : Int){
        
        ALERT(title: "\(selectItemIndex)", message: "选中了", controller: self)
    }
}
