//
//  ProgressBarView.swift
//  Progress
//
//  Created by Amy Alsaydi on 6/7/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {
    
    private var backgroundLayer: CAShapeLayer!
    private var foregroundLayer: CAShapeLayer!
    private var textLayer: CAShapeLayer!
    

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let width = rect.width
        let height = rect.height
        
        let lineWidth = 0.1 * min(width, height)
        
        let center = CGPoint(x: width/2, y: height/2)
        let radius = (min(width,height) - lineWidth) / 2
        
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        
        backgroundLayer = CAShapeLayer()
        
        backgroundLayer.path = circularPath.cgPath
        
        backgroundLayer.strokeColor = UIColor.lightGray.cgColor
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = lineWidth
        backgroundLayer.lineCap = .round
        
        layer.addSublayer(backgroundLayer)
        
        
        
    }
   

}
