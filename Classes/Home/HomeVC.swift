//
//  HomeVC.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/4.
//  Copyright © 2017年 szgyzb. All rights reserved.
//  首页

import UIKit

class HomeVC: UITableViewController,HomeBtnMenuCellDelegate {
    
    
    static let btnIdentifer = "HomeBtnMenuCell"
    static let killTimeIdentifer = "KillTimeCell"
    static let templateIdentifier = "HomeTemplateCell"
    static let bannerIdentifier = "BannerViewCell"
    
     var btnMenu = [HomeBtnItem]()
    var goodsMenu = [GoodsItem]()
    var templateS = [TemplateContentItem]()
    var banners = [BannerItem]()
    override init(style: UITableViewStyle){
        
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(requestHomeMsg))
        self.tableView.register(HomeBtnMenuCell.self, forCellReuseIdentifier: HomeVC.btnIdentifer)
        self.tableView.register(UINib.init(nibName: "KillTimeCell", bundle: nil), forCellReuseIdentifier: HomeVC.killTimeIdentifer)
        self.tableView.register(HomeTemplateCell.self, forCellReuseIdentifier: HomeVC.templateIdentifier)
        self.tableView.register(BannerViewCell.self, forCellReuseIdentifier: HomeVC.bannerIdentifier)
        self.requestHomeMsg()
    
    }
    
    

    //首页请求
    func requestHomeMsg(){
        
        self.requestForGetHomeNoticeList()
        self.requestForGetHomeBannerList()
        self.requestForGetHomeButtonList()
        self.requestForGetSpikeGoodsList()
        self.requestForGetHomeTemplate()
        
    }
    //请求首页轮播图列表
    func requestForGetHomeBannerList(){
        
        let param : GetHomeBannerListParam = GetHomeBannerListParam()
        param.StationId = "3"
        
        HomeTool.getHomeBannerListWithParam(param, success: { (result ) in
            
            if result.Status == 0{
                
                if result.DataList.count != 0 {
                    
                    self.banners = result.DataList
                    self.tableView.mj_header.endRefreshing()
                    self.tableView.reloadData()
                }else{
                   
                    
                }
            }
            
        }) { (error) in
            
            print("error = \(error.localizedDescription)")
        }
    }
    
    //获取首页上部功能按钮图标和文本10个
    func requestForGetHomeButtonList(){
        
        let param : GetHomeButtonListParam = GetHomeButtonListParam()
        param.StationId = "3"
        HomeTool.getHomeButtonListWithParam(param, success: { (result ) in
            
            if result.Status == 0{
                
                if result.DataList.count != 0 {
                    
                    self.btnMenu = result.DataList
                
                }else{
                    
                    
                }
            }
            
        }) { (error) in
            
            
        }
    }
    
    //请求首页模版
    func requestForGetHomeTemplate(){
        
        let param : GetHomeTemplateParam = GetHomeTemplateParam()
        param.StationId = "3"
        
        HomeTool.getHomeTemplateWithParam(param, success: { (result ) in
            
            if result.Status == 0{
                self.tableView.mj_header.endRefreshing()
               self.templateS = result.TemplateContent
                self.tableView.reloadData()
            }
            
        }) { (error) in
            
            
        }
    }
    
    //获取滚动公告列表
    func requestForGetHomeNoticeList(){
        
        let param : GetHomeNoticeListParam = GetHomeNoticeListParam()
        param.StationId = "3"
        
        HomeTool.getHomeNoticeListWithParam(param, success: { (result ) in
            
            if result.Status == 0{
                
                if result.DataList.count != 0 {
                    
                    
                }else{
                    
                    
                }
            }
            
        }) { (error) in
            
            
        }
    }
    
    //请求分类下的商品列表
    func requestForGetSpikeGoodsList(){
        
        let param : GetSpikeGoodsListParam = GetSpikeGoodsListParam()
        param.StationId = "3"
        
        HomeTool.getSpikeGoodsListWithParam(param, success: { (result ) in
            
            if result.Status == 0{
                
                
                if result.DataList.count != 0 {
                  
                    
                    self.goodsMenu = result.DataList
                
                }else{
                    
                    
                }
            }
            
        }) { (error) in
            
            
        }
    }
    
    //MARK: UITableViewDataSource
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section{
            
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return templateS.count
        default:
            return 1
        }
    }
    
    
    public override func numberOfSections(in tableView: UITableView) -> Int{
        
        return 4
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        switch indexPath.section {
        case 0:
            let bannerCell : BannerViewCell = tableView.dequeueReusableCell(withIdentifier: HomeVC.bannerIdentifier) as! BannerViewCell
            bannerCell.DataList = banners
            return bannerCell
        case 1:
            let btnsCell : HomeBtnMenuCell = tableView.dequeueReusableCell(withIdentifier: HomeVC.btnIdentifer) as! HomeBtnMenuCell
            btnsCell.delegate = self
            btnsCell.DataList = btnMenu
            return btnsCell
        case 2:
            let killCell : KillTimeCell = tableView.dequeueReusableCell(withIdentifier: HomeVC.killTimeIdentifer) as! KillTimeCell
            killCell.DataList = self.goodsMenu
            return killCell
        case 3:
            let templateCell : HomeTemplateCell = tableView.dequeueReusableCell(withIdentifier: HomeVC.templateIdentifier) as! HomeTemplateCell
            templateCell.item = self.templateS[indexPath.row]
            return templateCell
        default: break

        }
        
        return tableView.dequeueReusableCell(withIdentifier: "cell")!
    }
    
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        switch indexPath.section {
        case 0:
            
            return SCREEN_WIDTH * 0.44
        case 1:
            
            return 180
        case 2:
            
            return 140
        case 3:
            
            return SCREEN_WIDTH * 0.44
        default: break
            
        }
        return 0
    }
    
    //MARK: HomeBtnMenuCellDelegate
    func homeBtnMenuCellDidItemSelected(cell : HomeBtnMenuCell,selectItemIndex : Int){
        
        ALERT(title: "\(selectItemIndex)", message: "选中了", controller: self)
    }
}
