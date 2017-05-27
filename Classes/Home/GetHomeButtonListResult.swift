//
//  GetHomeButtonListResult.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/25.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class HomeBtnItem: Reflect {
    
    //按钮图标(135 *135)
    var ButtonImage : String?
    //按钮文本
    var ButtonText : String?
    //按钮右上角提示信息，如果内容空则不显示
    var ButtonTip : String?
    //是否替换本地默认的跳转，0不替换，1替换
    var ButtonIsReplace : NSNumber?
    //点击链接类型：
    var ButtonType : NSNumber?
    //点击链接参数值
    var ButtonValue : String?
    //跳转页的标题
    var ButtonTitle : String?
    //按钮文本的颜色对应的十六进制，比如	#FF4500
    var ButtonColor : String?
}

class GetHomeButtonListResult: Reflect {

    var Message :NSString?
    var Status :NSNumber?
    var DataCount : NSNumber?
    var DataList = [HomeBtnItem]()
    //按钮底部的整张背景图
    var ButtonBg : String?
}
