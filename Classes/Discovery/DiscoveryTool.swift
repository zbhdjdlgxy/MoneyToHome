//
//  DiscoveryTool.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/16.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class DiscoveryTool: NSObject {

    
    static let KGetCategoryGoodsList : String = HOST + "GetCategoryGoodsList"
    
    /**
     *
     *  获取分类下的商品列表
     *  @param param   请求参数
     *  @param success 请求成功后的回调
     *  @param failure 请求失败后的回调
     */
    class func getCategoryGoodsListWithParam(_ param : GetCategoryGoodsListParam,success : @escaping (_ result : GetCategoryGoodsListResult) -> Void,failure : @escaping (_ error : NSError) -> Void){
        MBProgressHUD.showMessage("加载中...")
        let dict = param.toDict()
        
        ZBHttpTool.getWithUrl(KGetCategoryGoodsList, params: dict, success: { (id) in
            
            MBProgressHUD.hide()
            let dic : NSDictionary = id as! NSDictionary
            success(GetCategoryGoodsListResult.parse(dict: dic))
        }) { (id) in
            
            MBProgressHUD.hide()
            let error : NSError = id as! NSError
            failure(id as! NSError)
            
            print("error = \(error.localizedDescription)")
        }
    }
}
