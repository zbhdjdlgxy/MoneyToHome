//
//  LineLabel.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/17.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class LineLabel: UILabel {

    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        let context : CGContext = UIGraphicsGetCurrentContext()!
        context.beginPath()
        context.move(to: CGPoint.init(x: 0, y: rect.size.height / 2))
        context.addLine(to: CGPoint.init(x: rect.size.width - 40, y: rect.size.height / 2))
        context.setLineWidth(0.5)
        context.setStrokeColor(UIColor.gray.cgColor)
        context.drawPath(using: .fillStroke)
    }

}
