//
//  UserLoginResult.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/5.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class UserLoginResult: Reflect {

    var Message :NSString = ""
    var Status :NSNumber = 0.0
    /**会员Id*/
    var UserId :NSNumber = 0.0
    /**社区站点Id*/
    var StationId :NSNumber = 0.0
    /**会员账户*/
    var UserAccount :NSString = ""
    /**会员密码*/
    var UserPassword :NSString = ""
    /**会员昵称*/
    var UserNickName :NSString = ""
    /**会员绑定的手机号*/
    var UserTelephone :NSString = ""
    /**会员头像路径地址*/
    var UserPhoto :NSString = ""
    /**会员VIP等级*/
    var UserLevel :NSString = ""
    /**会员钱豆余额*/
    var UserIntegral :NSNumber = 0.0
    /**会员钱包余额*/
    var UserMoney :NSString = ""
    /**会员生日（yyyy-MM-dd）*/
    var UserBirthday :NSString = ""
    /**会员学历*/
    var UserEducation :NSString = ""
    /**会员绑定邮箱*/
    var UserEmail :NSString = ""
    /**会员家庭成员人数*/
    var UserFamilyMemberCount :NSString = ""
    /**会员职业*/
    var UserOccupation :NSString = ""
    /**会员绑定七分钱*/
    var UserSevenPay :NSString = ""
    /**会员性别*/
    var UserSex :NSString = ""
    /**会员优惠卷*/
    var UserCouponsCount :NSNumber = 0.0
}
