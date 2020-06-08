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
    private var textLayer: CATextLayer!
    
    public var progress: CGFloat = 0 { // will be progress bar stroke end value [ 0 - 1 ]
        didSet {
            didUpdateProgress()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let width = rect.width
        let height = rect.height
        
        let lineWidth = 0.1 * min(width, height)
        
        backgroundLayer = createCircularLayer(strokeColor: UIColor.lightGray.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        
        // aka progress layer
        foregroundLayer = createCircularLayer(strokeColor: UIColor.red.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        
        textLayer = createTextLayer(textColor: UIColor.white)
        
        //progress = 0
        foregroundLayer.strokeEnd = 0
        //foregroundLayer.strokeEnd = 0.3 // this is what i will use to display the progress of the application - incrementing or decrementing by 0.2
        
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(foregroundLayer)
        layer.addSublayer(textLayer)
        
        
    }
    
    private func createCircularLayer(strokeColor: CGColor, fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = 2 * CGFloat.pi + startAngle
        
        let width = frame.size.width
        let height = frame.size.height
        
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = (min(width, height) - lineWidth) / 2
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = fillColor
        shapeLayer.lineCap = .round
        
        return shapeLayer
    }
    
    private func createTextLayer(textColor: UIColor) -> CATextLayer {
        
        let width = frame.size.width
        let height = frame.size.height
        
        let fontSize = min(width, height) / 4 - 5
        let offset = min(width, height) * 0.1
        
        let layer = CATextLayer()
        
        layer.string = "\(Int(progress * 100))"
        layer.backgroundColor = UIColor.clear.cgColor
        layer.foregroundColor = textColor.cgColor
        layer.fontSize = fontSize
        layer.frame = CGRect(x: 0, y: (height - fontSize - offset) / 2, width: width, height: height)
        layer.alignmentMode = .center
        
        return layer
    }
    
    private func didUpdateProgress() {
        textLayer?.string = "\(Int(progress * 100))" // ??
        foregroundLayer?.strokeEnd = progress
    }
    
}
