//
//  BannerViewCell.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/24.
//  Copyright © 2017年 szgyzb. All rights reserved.
//  轮播图cell

import UIKit

class BannerViewCell: UITableViewCell {

    var DataList : Array<BannerItem>{
        
        willSet{
            
            var pics = [String]()
            for item in newValue{
                
                pics.append(item.BannerCutPath1!)
            }
            cycleView.imageURLArray = pics
           
        }
    }
    
    var cycleView : CyclePictureView = {
        
        let view : CyclePictureView = CyclePictureView.init(frame: .zero, imageURLArray: [String]())
        view.autoScroll = true
        view.timeInterval = 1
        view.placeholderImage = UIImage(named: "place_photo")
        return view
    }()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        DataList = [BannerItem]()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.cycleView)
       
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
         cycleView.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
