//
//  GetGoodsCategoryListResult.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/19.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class GoodsCategoryItem: Reflect {
    
    /**
     * 品类ID
     */
    var CategoryId : NSNumber?
    /**
     * 品类的上一级的Id
     */
    var CategoryFatherId : NSNumber?
    /**
     * 品类是否热卖
     */
    var CategoryIsHot : NSNumber?
    /**
     * 品类名称
     */
    var CategoryName : String?
    /**
     * 品类图标
     */
    var CategoryImg : String?
    /**
     * 商品标签文本
     */
    var CategoryNumber : NSNumber?
}


class GetGoodsCategoryListResult: Reflect {

    var Message :NSString?
    var Status :NSNumber?
    var DataList : Array<GoodsCategoryItem> = []
}
