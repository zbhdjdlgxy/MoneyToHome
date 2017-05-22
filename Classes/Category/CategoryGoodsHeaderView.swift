//
//  CategoryGoodsHeaderView.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/22.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class CategoryGoodsHeaderView: UICollectionReusableView {
    
    var title: String = ""{
        
        willSet{
            
            categoryLabel.text = newValue
        }
    }
    
    var categoryLabel : UILabel = {
        
        let label : UILabel = UILabel.quickInit(text: "",textColor : RGB(r: 1, g: 166, b: 83),font : UIFont.systemFont(ofSize: 14.0),textAlignment : .center)
        return label
    }()
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.addSubview(categoryLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.categoryLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.frame.size.width)
            make.height.equalTo(self.frame.size.height)
        }
    }
    
        
}
