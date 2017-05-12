//
//  LogTool.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/5.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class LogTool: NSObject {

    static let KUserLogin : String = HOST + "UserLogin"
    
    /**
     * 登录
     *
     *  @param param   请求参数
     *  @param success 请求成功后的回调
     *  @param failure 请求失败后的回调
     */
    class func userLoginWithParam(_ param : UserLoginParam,success : @escaping (_ result : UserLoginResult) -> Void,failure : @escaping (_ error : NSError) -> Void){
        MBProgressHUD.showMessage("登录中...")
        let dict = param.toDict()
        
        ZBHttpTool.getWithUrl(KUserLogin, params: dict, success: { (id) in
            
            MBProgressHUD.hide()
            let dic : NSDictionary = id as! NSDictionary
           print("\(dic)")
            success(UserLoginResult.parse(dict: id as! NSDictionary))
        }) { (id) in
            
           MBProgressHUD.hide()
            let error : NSError = id as! NSError
            failure(id as! NSError)
    
            print("error = \(error.localizedDescription)")
        }
    }
}
