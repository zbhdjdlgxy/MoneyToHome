//
//  logVC.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/4.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class LogVC: UIViewController {
    
    
    var headImg : UIImageView = UIImageView.init(image: UIImage.init(named: "login_logo"))
    
    var userNameTF : LeftWordTF = {
        
        var name = LeftWordTF.init()
        name.title = "    账号:"
        name.placeholder = "手机号／用户名／邮箱"
        return name
    }()
    
    var pwdTF : LeftWordTF = {
        
        var pwd = LeftWordTF.init()
        pwd.title = "    密码"
        pwd.placeholder = "请输入登录密码"
        pwd.isSecureTextEntry = true;
        return pwd
    }()
    
    var logBtn : UIButton = {
        
        let btn : UIButton = UIButton(type: .custom)
        btn.backgroundColor = RGB(r : 0,g : 1,b : 0)
        btn.setTitle("登录", for: UIControlState())
        btn.backgroundColor = RGB(r: 1, g: 166, b: 83)
        btn.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        return btn
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "账号密码登录"
        let leftBar : UIBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "icon_nav_dismiss"), style: .plain, target: self, action: #selector(dismissVC))
        self.navigationItem.leftBarButtonItem = leftBar
    }
    
    override func loadView() {
        
        self.view = UIView.init()
        self.view.addSubview(headImg)
        self.view.addSubview(userNameTF)
        self.view.addSubview(pwdTF)
        self.view.addSubview(logBtn)
    
        
        headImg.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.view)
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(SCREEN_HEIGHT * 0.2)
            make.top.equalTo(self.view.snp.top).offset(64)
        }
        
        userNameTF.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.view)
            make.top.equalTo(headImg.snp.bottom)
            make.height.equalTo(44)
        }
        
        pwdTF.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.view)
            make.top.equalTo(userNameTF.snp.bottom)
            make.height.equalTo(44)

        }
        
        logBtn.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(SCREEN_WIDTH * 0.9)
            make.height.equalTo(44)
            make.top.equalTo(pwdTF.snp.bottom).offset(10)
        }
    }
    
    func dismissVC(){
        
        self.dismiss(animated: false, completion: nil)
        
    }

    func logIn(){
        
        
        self.view.endEditing(true)
        
        if pwdTF.text == "" {
            
            ALERT(title: "", message: "密码为空",controller : self)
            return
            
        }
        if userNameTF.text == "" {
            
            ALERT(title: "", message: "账号为空",controller : self)
            return
        }
        self.requestForLog()
    }
    
    func requestForLog(){
        
        let param : UserLoginParam = UserLoginParam()
        param.key = SYSTEM_KEY
        param.UserAccount = userNameTF.text!
        param.UserPassword = pwdTF.text!
        
        LogTool.userLoginWithParam(param, success: { (result ) in
            
            if result.Status == 0{
                
                NSKeyedArchiver.archiveRootObject(result, toFile: USER_FILE_PATH)
                
                self.dismiss(animated: true, completion: nil)
            }else{
                
                MBProgressHUD.showError(result.Message as String!)
            }
        }) { (error) in
            
            
        }
    }
    
    

}
