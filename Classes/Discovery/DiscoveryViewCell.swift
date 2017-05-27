//
//  DiscoveryViewCell.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/16.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

protocol DiscoveryViewCellDelegate {
    
    func discoveryViewCellDidCarClicked(cell : DiscoveryViewCell)
}

class DiscoveryViewCell: UICollectionViewCell {
    
    
    var delegate : DiscoveryViewCellDelegate?
    //商品图片
    var goodsImg : UIImageView = {
        
        let image : UIImageView = UIImageView.init()
        return image
        
    }()
    //商品名字
    var goosName : UILabel = {
        
        let label : UILabel = UILabel.quickInit(text: "",textColor : UIColor.black,font : UIFont.systemFont(ofSize: 14.0),textAlignment : .center)
        return label
        
    }()
    //打折后价格
    var discountPrice : UILabel = {
        
        let label : UILabel = UILabel.quickInit(text: "",textColor : UIColor.orange,font : UIFont.systemFont(ofSize: 16.0),textAlignment : .left)
        return label
        
    }()
    //原价
    var originalPrice : LineLabel = {
        
        let label : LineLabel = LineLabel.init()
        label.text = ""
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textAlignment = .left
        return label
        
    }()
    //购物车
    var shoppingCarBtn : UIButton = {
        
        let button : UIButton = UIButton.init(type: UIButtonType.custom)
        button.setBackgroundImage(UIImage.init(named: "car_normal"), for: UIControlState.normal)
        
        return button
    }()
    
    var goodsItem : GoodsItem{
        
        willSet{
            
            let url = URL(string: newValue.GoodsThumbImg1!)
        
            self.goodsImg.kf.setImage(with: url)
            self.goosName.text = newValue.GoodsName
            self.originalPrice.text = String(format: "¥%0.2f",(newValue.AttributePriceSCJ?.floatValue)!)
            self.discountPrice.text = String(format: "¥%0.2f",(newValue.AttributePriceCGJ?.floatValue)!)
        }
    }
    
    
    override init(frame: CGRect) {
        
        self.goodsItem = GoodsItem()
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
        self.addSubview(self.goodsImg)
        self.addSubview(self.goosName)
        self.addSubview(self.originalPrice)
        self.addSubview(self.discountPrice)
        self.addSubview(self.shoppingCarBtn)
        self.shoppingCarBtn.addTarget(self, action: #selector(shopCarClicked), for: UIControlEvents.touchUpInside)
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.goodsImg.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.centerX.equalTo(self.snp.centerX)
            make.width.height.equalTo(self.frame.size.width * 0.9)
        }
        
        self.goosName.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.goodsImg.snp.bottom).offset(5)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.frame.size.width)
            make.height.equalTo(20)
        }
        
        self.originalPrice.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.goosName.snp.bottom).offset(3)
            make.left.equalTo(self).offset(2)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        self.discountPrice.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.originalPrice.snp.bottom).offset(3)
            make.left.equalTo(self).offset(2)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        self.shoppingCarBtn.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.goosName.snp.bottom).offset(10)
            make.right.equalTo(self).offset(-3)
            make.width.height.equalTo(38)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func shopCarClicked()  {
        self.delegate?.discoveryViewCellDidCarClicked(cell: self)
    }
}
