//
//  GetCategoryGoodsListParam.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/16.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class GetCategoryGoodsListParam: Reflect {

    var key : String = SYSTEM_KEY
    var StationId : String?
    var CategoryId : String = "0"
    var KeyWord : String = "0"
    var PageSize : String = "20"
    var PageIndex : Int?
    var SortFlag : String = "0"
}
