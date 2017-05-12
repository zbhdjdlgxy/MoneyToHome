//
//  Global.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/5.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
//生产环境
//public let HOST : String = "https://www.qianjidaojia.com/api/v1/Mobile/V1.asmx/"
//开发环境
public let HOST : String = "https://www.qianjidaojia.com/api/apitest/Mobile/V1.asmx/"

// 系统连接请求识别标识码
public let SYSTEM_KEY : String = "admin"

public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
/**
 RGB转换
 */
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    //
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

/**
 弹框提示
 */
func ALERT(title : String,message : String,controller : UIViewController){
    
    let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil)
    
    alert.addAction(okAction)
    
    controller.present(alert, animated: true, completion: nil)

}
/**
 登录用户信息保存目录
 */
public var USER_FILE_DIRECTORY : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
/**
 登录用户信息保存文件路径
 */
public let USER_FILE_PATH : String = USER_FILE_DIRECTORY+"person.plist"
