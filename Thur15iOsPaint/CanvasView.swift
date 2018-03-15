//
//  CanvasView.swift
//  Thur15iOsPaint
//
//  Created by David Svensson on 2018-03-15.
//  Copyright © 2018 David Svensson. All rights reserved.
//

import Foundation
import UIKit

// Används inte! Kan raderas!
class CanvasView : UIView {
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.magenta.cgColor)
            context.setLineWidth(10)
            context.beginPath()
            context.move(to: CGPoint(x: 0, y: 0))
            context.addLine(to: CGPoint(x: 150, y: 400))
            context.addLine(to: CGPoint(x: 200, y: 400))
            context.strokePath()
        }
    }
    
    
}
