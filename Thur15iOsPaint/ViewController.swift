//
//  ViewController.swift
//  Thur15iOsPaint
//
//  Created by David Svensson on 2018-03-15.
//  Copyright © 2018 David Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvas: UIImageView!
    var start: CGPoint?
    var paintColor = UIColor.magenta.cgColor
    
    var lineWidth: CGFloat = 5
    let maxLineWidth: CGFloat = 15
    let minLineWidth:CGFloat = 2
    let deltaLineWidth:CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeColor(_ sender: UIBarButtonItem) {
        paintColor = (sender.tintColor?.cgColor)!
    }
    
    @IBAction func clearImage(_ sender: UIBarButtonItem) {
        canvas.image = nil
    }
    
    @IBAction func increaseLineWidth(_ sender: UIBarButtonItem) {
        if lineWidth < maxLineWidth - deltaLineWidth {
            lineWidth += deltaLineWidth
        }
    }
    
    @IBAction func decreaseLineWidth(_ sender: UIBarButtonItem) {
        if lineWidth > minLineWidth + deltaLineWidth {
            lineWidth -= deltaLineWidth
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            start = touch.location(in: canvas)
            //print("Touches began: \(point.x), \(point.y) ")
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let end  = touch.location(in: canvas)
            if let start = self.start {
                drawFromPoint(start: start, toPoint: end)
            }
         self.start = end
        }
    }
    
    func drawFromPoint(start: CGPoint, toPoint end: CGPoint) {
        UIGraphicsBeginImageContext(canvas.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            canvas.image?.draw(in: CGRect(x: 0, y: 0, width: canvas.frame.size.width, height: canvas.frame.size.height))
            
            context.setStrokeColor(paintColor)
            context.setLineWidth(lineWidth)
            context.setLineCap(.round)
            context.beginPath()
            context.move(to: start)
            context.addLine(to: end)
            context.strokePath()
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            canvas.image = newImage
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

