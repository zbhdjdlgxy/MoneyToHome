//
//  CategoryCollectionViewCell.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/22.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    var icon : UIImageView = {
        
        let image : UIImageView = UIImageView.init()
        return image
        
    }()
    
    var title : UILabel = {
        
        let label : UILabel = UILabel.quickInit(text: "",textColor : UIColor.black,font : UIFont.systemFont(ofSize: 14.0),textAlignment : .center)
        return label
        
    }()
    
    var goodsItem : GoodsCategoryItem{
        
        willSet{
            
            let url = URL(string: newValue.CategoryImg!)
            
            self.icon.kf.setImage(with: url)
            self.title.text = newValue.CategoryName
        }
    }
    
    override init(frame: CGRect) {
        
        self.goodsItem = GoodsCategoryItem()
        super.init(frame: frame)
        self.addSubview(self.icon)
        self.addSubview(self.title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.icon.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.centerX.equalTo(self.snp.centerX)
            make.width.height.equalTo(self.frame.size.width * 0.8)
        }
        
        self.title.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.icon.snp.bottom).offset(-12)
            make.centerX.equalTo(self.snp.centerX)
            make.width.height.equalTo(self.frame.size.width)
        }
    }
}
