//
//  GetHomeTemplateResult.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/25.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class PicItem: Reflect {
    
    //模版图片地址
    var Path : String?
    /*点击响应类型：
     1：单个商品，
     2：分类商品，
     3：属性商品，
     4：URL
     5：公告文本
     7：文本提示（比如：敬请期待）*/
    var `Type` : NSNumber?
    //点击链接参数值
    var Value : String?
    //跳转页的标题
    var Title : String?
}

class TemplateContentItem: Reflect {
    /*1：1副
     2：2副,左右
     3：3副,左中右
     4：3副,上下右
     5：3副,左上下*/
    var PicType : NSNumber?
    
    //模版图片地址
    var PicArray = [PicItem]()
    
}

class GetHomeTemplateResult: Reflect {

    var TemplateContent = [TemplateContentItem]()
    var Message :NSString?
    var Status :NSNumber?
}
