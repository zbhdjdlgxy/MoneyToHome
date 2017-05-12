//
//  BaseNavVC.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/8.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class BaseNavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance : UINavigationBar = UINavigationBar.appearance()
        appearance.barTintColor = RGB(r: 1, g: 166, b: 83)

    }
   
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
       if self.viewControllers.count > 0{
            
            viewController.hidesBottomBarWhenPushed = true;
            let leftBar = UIBarButtonItem(image: UIImage.init(named: "navigationbar_back"), style: .plain, target: self, action: #selector(popToPre))
            viewController.navigationItem.leftBarButtonItem = leftBar
        }
        super.pushViewController(viewController, animated: true)
        
    }
    
    
    func popToPre() {
        
        self.popViewController(animated: true)
    }
}
