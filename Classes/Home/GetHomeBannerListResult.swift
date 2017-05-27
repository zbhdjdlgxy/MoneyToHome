//
//  GetHomeBannerListResult.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/23.
//  Copyright © 2017年 szgyzb. All rights reserved.
//  轮播图结果

import UIKit

class BannerItem: Reflect {
    
    var BannerId : NSNumber?   //轮播图id
    var BannerCutPath1 : String?//裁剪格式1图片路径
    var BannerType : NSNumber? //点击链接类型：1：单个商品，2：分类商品，3：属性商品，4：URL 5：公告文本 7：文本提示（比如：敬请期待）

    var BannerValue : String? //点击链接参数值
    var BannerTitle : String?  //跳转页的标题
}


class GetHomeBannerListResult: Reflect {
    
    var Message :NSString?
    var Status :NSNumber?
    var DataCount : NSNumber? //列表数量
    var DataList = [BannerItem]()
}
