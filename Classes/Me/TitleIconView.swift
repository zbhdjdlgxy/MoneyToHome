//
//  TitleIconView.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/11.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class TitleIconView: UIView {
    
    var title : String{
        
        get{
            
            return self.titleLabel.text!
        }
        set{
            
            self.titleLabel.text = newValue
        }
    }
    
    var image : String{
        
        get{
            return ""
        }
        set{
            if newValue.hasPrefix("http") {
                let url = URL(string: newValue)
                
                self.icon.kf.setImage(with: url)
            }else{
                 self.icon.image = UIImage.init(named: newValue)
            }
            
           
        }
    }
    
    var borderLine : Bool{
        
        get{
            
            return false
        }
        set{
            
            if newValue {
                
                self.layer.borderWidth = 0.5
                self.layer.borderColor = RGB(r: 220, g: 220, b: 220).cgColor
            }
        }
    }

    var titleLabel : UILabel = {
        
        let label : UILabel = UILabel.init()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label;
        
    }()
    
    var icon : UIImageView = {
        
        let image : UIImageView = UIImageView.init()
        return image
        
    }()

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.addSubview(self.icon)
        self.addSubview(self.titleLabel)
        

    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.icon.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.snp.top).offset(10)
            make.centerX.equalTo(self.snp.centerX)
            make.height.width.equalTo(self.frame.size.height * 0.4)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.icon.snp.bottom).offset(2)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
