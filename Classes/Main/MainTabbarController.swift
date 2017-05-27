//
//  MainTabbarController.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/8.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit
class MainTabbarController: UITabBarController,ZBTabBarDelegate{


    
    var customTabBar : ZBTabBar?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 删除系统自动生成的UITabBarButton
        for child in self.tabBar.subviews {
            if child is UIControl{
                
                child.removeFromSuperview()
            }
        }
        
        let user :UserLoginResult? = NSKeyedUnarchiver.unarchiveObject(withFile: USER_FILE_PATH) as! UserLoginResult?
        if user == nil {
            
            let button : TabBarBtn = (customTabBar?.tabBarButtons[0])!
            button.isSelected = true
            customTabBar?.selectedButton.isSelected = false
            customTabBar?.selectedButton = button
            self.selectedIndex = 0
        }
           
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabbar()
       self.setupAllChildViewControllers()
        
    }
    
    func setupTabbar(){
        
        let customTabBar : ZBTabBar = ZBTabBar()
        customTabBar.frame = self.tabBar.bounds;
        customTabBar.delegate = self;
        self.tabBar.addSubview(customTabBar)
        self.customTabBar = customTabBar;
    }
    
    func setupAllChildViewControllers(){
        
        // 1.首页
        let homeVC : HomeVC = HomeVC.init(style: .grouped)
        self.setupChildViewController(homeVC, title: "首页", imageName: "tabbar_home", selectedImageName: "tabbar_home_selected")
        
        // 2.品类
        let categoryVC : CategoryVC = CategoryVC()
        self.setupChildViewController(categoryVC, title: "品类", imageName: "tabbar_category", selectedImageName: "tabbar_category_selected")
        
        // 3.购物车
        let shopVC : ShoppingCarVC = ShoppingCarVC()
        self.setupChildViewController(shopVC, title: "", imageName: "tabbar_car", selectedImageName: "tabbar_car")
        
        // 4.发现
        let discoveryVC : DiscoveryVC = DiscoveryVC()
        self.setupChildViewController(discoveryVC, title: "发现", imageName: "tabbar_discovery", selectedImageName: "tabbar_discovery_selected")
        
        // 5.我
        let meVC : MeVC = MeVC.init(style: .grouped)
        self.setupChildViewController(meVC, title: "我", imageName: "tabbar_me", selectedImageName: "tabbar_me_selected")
    }
    func setupChildViewController(_ childVc : UIViewController,title:String,imageName:String,selectedImageName:String) {
        
        // 1.设置控制器的属性
        childVc.title = title;
        // 设置图标
        childVc.tabBarItem.image = UIImage.init(named: imageName)
        // 设置选中的图标
        let selectedImage : UIImage = UIImage.init(named: selectedImageName)!
        childVc.tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        
        // 2.包装一个导航控制器
        let nav : BaseNavCTL = BaseNavCTL(rootViewController: childVc)
        self.addChildViewController(nav)
        
        // 3.添加tabbar内部的按钮
        self.customTabBar!.addTabBarButtonWithItem(childVc.tabBarItem)
    }
    
//    MARK: ZBTabBarDelegate
    func tabBar(_ tabBar : ZBTabBar, selectBtnFrom : Int,to : Int){
        
        self.selectedIndex = to;
       
    }
    
    func tabBarLogStatus(_ tabBar : ZBTabBar, selectBtnFrom : Int,to : Int){
    
        self.selectedIndex = to;
        let user :UserLoginResult? = NSKeyedUnarchiver.unarchiveObject(withFile: USER_FILE_PATH) as! UserLoginResult?
        if user == nil {
            
            let logVC : LogVC = LogVC()
            let nav :BaseNavVC = BaseNavVC(rootViewController: logVC)
            self.present(nav, animated: false, completion: nil)
            
        }
        
        
    }

}
