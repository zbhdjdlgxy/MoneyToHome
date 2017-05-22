//
//  GetCategoryGoodsListResult.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/16.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class GoodsItem: Reflect {
    
    /**
     * 商品的Id
     */
    var GoodsId : NSNumber?
    /**
     * 商品名称
     */
    var GoodsName : String?
    /**
     * 商品图片
     */
    var GoodsThumbImg1 : String?
    /**
     * 商品的口号标语
     */
    var GoodsSlogan : String?
    /**
     * 商品状态，1.售中，2.售完，3.待售，4.下线
     */
    var GoodsState : NSNumber?
    /**
     * 商品标签文本
     */
    var GoodsTagText : String?
    /**
     * 是否配送范围内，0否1是
     */
    var GoodsInDistribution : NSNumber?
    /**
     * 商品规格Id
     */
    var AttributeId : NSNumber?
    /**
     * 商品规格名称
     */
    var AttributeName : String?
    /**
     * 商品常规价格，钱记会员价
     */
    var AttributePriceCGJ : NSNumber?
    /**
     * 商品市场价
     */
    var AttributePriceSCJ : NSNumber?
    /**
     * 商品库存数
     */
    var AttributeStock : NSNumber?
}

class GetCategoryGoodsListResult: Reflect {

    var Status :NSNumber = 0.0
    var DataCount :NSNumber = 0.0
    var DataList : Array<GoodsItem> = []
    
}
