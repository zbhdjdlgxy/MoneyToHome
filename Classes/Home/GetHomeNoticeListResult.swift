//
//  GetHomeNoticeListResult.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/25.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class HomeNoticeItem: Reflect {
    
    //公告信息Id
    var NoticeId : NSNumber?
    //公告信息标题
    var NoticeText : String?
    
    /*点击链接类型：
    1：单个商品，
    2：分类商品，
    3：属性商品，
    4：URL
    5：公告文本
    7：文本提示（比如：敬请期待）*/
    var NoticeType : NSNumber?
    //点击链接参数值
    var NoticeValue : String?
    //跳转页的标题
    var NoticeTitle : String?
}

class GetHomeNoticeListResult: Reflect {

    var Message :NSString?
    var Status :NSNumber?
    var DataCount : NSNumber?
    //点击链接参数值
    var Value : String?
    var DataList = [HomeNoticeItem]()
}
