//
//  CategoryTool.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/19.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class CategoryTool: NSObject {

    
    static let KGetGoodsCategoryList : String = HOST + "GetGoodsCategoryList"
    
    /**
     * 登录
     *
     *  @param param   请求参数
     *  @param success 请求成功后的回调
     *  @param failure 请求失败后的回调
     */
    class func getCategoryGoodsListWithParam(_ param : GetGoodsCategoryListParam,success : @escaping (_ result : GetGoodsCategoryListResult) -> Void,failure : @escaping (_ error : NSError) -> Void){
        MBProgressHUD.showMessage("加载中...")
        let dict = param.toDict()
        
        ZBHttpTool.getWithUrl(KGetGoodsCategoryList, params: dict, success: { (id) in
            
            MBProgressHUD.hide()
            let dic : NSDictionary = id as! NSDictionary
            print("dic=\(dic)")
            success(GetGoodsCategoryListResult.parse(dict: dic))
        }) { (id) in
            
            MBProgressHUD.hide()
            let error : NSError = id as! NSError
            failure(id as! NSError)
            
            print("error = \(error.localizedDescription)")
        }
    }
}
