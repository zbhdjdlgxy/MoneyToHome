//
//  HomeTool.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/23.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class HomeTool: NSObject {

    
    static let KGetHomeBannerList : String = HOST + "GetHomeBannerList"
    static let KGetSpikeGoodsList : String = HOST + "GetSpikeGoodsList"
    static let KGetHomeTemplate : String = HOST + "GetHomeTemplate"
    static let KGetHomeNoticeList : String = HOST + "GetHomeNoticeList"
    static let KGetHomeButtonList : String = HOST + "GetHomeButtonList"
    
    /**
     *  首页轮播图列表
     *
     *  @param param   请求参数
     *  @param success 请求成功后的回调
     *  @param failure 请求失败后的回调
     */
    class func getHomeBannerListWithParam(_ param : GetHomeBannerListParam,success : @escaping (_ result : GetHomeBannerListResult) -> Void,failure : @escaping (_ error : NSError) -> Void){
        MBProgressHUD.showMessage("加载中...")
        let dict = param.toDict()
        
        ZBHttpTool.getWithUrl(KGetHomeBannerList, params: dict, success: { (id) in
            
            MBProgressHUD.hide()
            let dic : NSDictionary = id as! NSDictionary
            success(GetHomeBannerListResult.parse(dict: dic))
        }) { (id) in
            
            MBProgressHUD.hide()
            let error : NSError = id as! NSError
            print("error = \(error.localizedDescription)")
            failure(id as! NSError)
            
            
        }
    }
    
    /**
     *  首页模版
     *
     *  @param param   请求参数
     *  @param success 请求成功后的回调
     *  @param failure 请求失败后的回调
     */
    class func getHomeTemplateWithParam(_ param : GetHomeTemplateParam,success : @escaping (_ result : GetHomeTemplateResult) -> Void,failure : @escaping (_ error : NSError) -> Void){
        //MBProgressHUD.showMessage("加载中...")
        let dict = param.toDict()
        
        ZBHttpTool.getWithUrl(KGetHomeTemplate, params: dict, success: { (id) in
            
           // MBProgressHUD.hide()
            let dic : NSDictionary = id as! NSDictionary
            success(GetHomeTemplateResult.parse(dict: dic))
        }) { (id) in
            
            MBProgressHUD.hide()
            let error : NSError = id as! NSError
            failure(id as! NSError)
            
            print("error = \(error.localizedDescription)")
        }
    }
    
    /**
     *  获取滚动公告列表
     *
     *  @param param   请求参数
     *  @param success 请求成功后的回调
     *  @param failure 请求失败后的回调
     */
    class func getHomeNoticeListWithParam(_ param : GetHomeNoticeListParam,success : @escaping (_ result : GetHomeNoticeListResult) -> Void,failure : @escaping (_ error : NSError) -> Void){
        //MBProgressHUD.showMessage("加载中...")
        let dict = param.toDict()
        
        ZBHttpTool.getWithUrl(KGetHomeNoticeList, params: dict, success: { (id) in
            
            //MBProgressHUD.hide()
            let dic : NSDictionary = id as! NSDictionary
            success(GetHomeNoticeListResult.parse(dict: dic))
        }) { (id) in
            
            MBProgressHUD.hide()
            let error : NSError = id as! NSError
            failure(id as! NSError)
            
            print("error = \(error.localizedDescription)")
        }
    }
    
    /**
     *  获取首页上部功能按钮图标和文本10个
     *
     *  @param param   请求参数
     *  @param success 请求成功后的回调
     *  @param failure 请求失败后的回调
     */
    class func getHomeButtonListWithParam(_ param : GetHomeButtonListParam,success : @escaping (_ result : GetHomeButtonListResult) -> Void,failure : @escaping (_ error : NSError) -> Void){
        //MBProgressHUD.showMessage("加载中...")
        let dict = param.toDict()
 
        ZBHttpTool.getWithUrl(KGetHomeButtonList, params: dict, success: { (id) in
            
           // MBProgressHUD.hide()
            let dic : NSDictionary = id as! NSDictionary
            success(GetHomeButtonListResult.parse(dict: dic))
        }) { (id) in
            
            MBProgressHUD.hide()
            let error : NSError = id as! NSError
            failure(id as! NSError)
            
            print("error = \(error.localizedDescription)")
        }
    }
    
    
    /**
     *
     *  获取秒杀活动商品列表
     *  @param param   请求参数
     *  @param success 请求成功后的回调
     *  @param failure 请求失败后的回调
     */
    class func getSpikeGoodsListWithParam(_ param : GetSpikeGoodsListParam,success : @escaping (_ result : GetSpikeGoodsListResult) -> Void,failure : @escaping (_ error : NSError) -> Void){
        //MBProgressHUD.showMessage("加载中...")
        let dict = param.toDict()
        
        ZBHttpTool.getWithUrl(KGetSpikeGoodsList, params: dict, success: { (id) in
            
            //MBProgressHUD.hide()
            let dic : NSDictionary = id as! NSDictionary
            success(GetSpikeGoodsListResult.parse(dict: dic))
        }) { (id) in
            
            MBProgressHUD.hide()
            let error : NSError = id as! NSError
            failure(id as! NSError)
            
            print("error = \(error.localizedDescription)")
        }
    }
}
