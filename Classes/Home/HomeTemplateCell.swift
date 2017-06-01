//
//  HomeTemplateCell.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/27.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class HomeTemplateCell: UITableViewCell {

    var  item : TemplateContentItem{
        
        willSet{
            
            switch newValue.PicType!.intValue {
            case 1:
                let picItem : PicItem = newValue.PicArray.last!
                let image : UIImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: self.frame.size.height))
                let url = URL(string: picItem.Path!)
                image.kf.setImage(with: url, placeholder: UIImage.init(named: PLACEHOLDER_PHOTO), options: nil, progressBlock: nil, completionHandler: nil)
                self.addSubview(image)
            case 2:
                
                let imageW = SCREEN_WIDTH / 2
                let imageH = self.frame.size.height
                for index in 0..<2{
                    
                    let picItem : PicItem = newValue.PicArray[index]
                    let image : UIImageView = UIImageView.init(frame: CGRect(x: imageW * CGFloat(index), y: 0, width: imageW, height:imageH))
                    let url = URL(string: picItem.Path!)
                    image.kf.setImage(with: url, placeholder: UIImage.init(named: PLACEHOLDER_PHOTO), options: nil, progressBlock: nil, completionHandler: nil)
                    self.addSubview(image)
                }
            case 3:
                let imageW = SCREEN_WIDTH / 3
                let imageH = self.frame.size.height
                for index in 0..<3{
                    
                    let picItem : PicItem = newValue.PicArray[index]
                    let image : UIImageView = UIImageView.init(frame: CGRect(x: imageW * CGFloat(index), y: 0, width: imageW, height:imageH))
                    let url = URL(string: picItem.Path!)
                    image.kf.setImage(with: url, placeholder: UIImage.init(named: PLACEHOLDER_PHOTO), options: nil, progressBlock: nil, completionHandler: nil)
                    self.addSubview(image)
                }
            case 4:
                break
            case 5:
                break
            default:
                break
            
            }
            self.layoutIfNeeded()
            
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        item = TemplateContentItem()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
