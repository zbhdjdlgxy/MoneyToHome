//
//  KillTimeCell.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/26.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class KillTimeCell: UITableViewCell {

    
    
    @IBOutlet weak var hourLabel: UILabel!
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var DataList : Array<GoodsItem>{
        
        willSet{
            
            let itemW = self.frame.size.width / 5
            
            let itemH = self.frame.size.height - 31.0
            let titleH = 20
            let imageH = itemH - 20
            for index in 0..<newValue.count{
                
                let item : GoodsItem = newValue[index]
                let url = URL(string: item.GoodsThumbImg1!)
        
                let image : UIImageView = UIImageView.init(frame: CGRect(x: CGFloat(index) * itemW, y: 0, width: itemW, height: imageH))
                let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(selectItem(image:)))
                image.addGestureRecognizer(tapGesture)
                image.tag = index
                image.kf.setImage(with: url, placeholder: UIImage.init(named: PLACEHOLDER_PHOTO), options: nil, progressBlock: nil, completionHandler: nil)
                let title : UILabel = UILabel.init(frame: CGRect(x: CGFloat(index) * itemW, y: imageH, width: itemW, height: CGFloat(titleH)))
                title.font = UIFont.systemFont(ofSize: 13.0)
                
                title.text = String(format: "%0.2f", (item.AttributePriceCGJ?.floatValue)!)
                title.textAlignment = NSTextAlignment.center
                title.textColor = UIColor.red
                scrollView.addSubview(image)
                scrollView.addSubview(title)
            }
            scrollView.contentSize = CGSize(width: itemW * CGFloat(newValue.count), height: itemH)
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        
        DataList = [GoodsItem]()
        super.init(coder: aDecoder)!
        let timer : Timer = Timer.init(timeInterval: 1, target: self, selector: #selector(flushTime), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    
    //刷新倒计时
    func flushTime(){
        let calendar: Calendar = Calendar(identifier: .chinese)
        var comps: DateComponents = DateComponents()
        comps = calendar.dateComponents([.year,.month,.day, .weekday, .hour, .minute,.second], from: Date())
        
        let hour = 24 - comps.hour!
        let minute = 60 - comps.minute!
        let second = 60 - comps.second!
        
        hourLabel.text = "\(hour)"
        
        minuteLabel.text = "\(minute)"
        secondLabel.text = "\(second)"
        
    }
    
    func selectItem(image : UIImageView) {
        
        
    }
    
    
    
}
