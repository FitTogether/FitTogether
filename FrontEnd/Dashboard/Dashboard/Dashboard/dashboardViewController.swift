//
//  dashboardViewController.swift
//  Dashboard
//
//  Created by CJ Voege on 11/17/14.
//  Copyright (c) 2014 CJ Voege. All rights reserved.
//

import UIKit

class dashboardViewController: UIViewController {

    //circle to be animated
    let shape = CAShapeLayer()
    let progress = CAShapeLayer()
    
    //function that converts degrees to radians
    func DegreesToRadians (value:Float) -> Float {
        return value * Float(M_PI) / 180.0
    }
    
    @IBOutlet weak var avgStepView: UIView!
   
    @IBOutlet weak var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CIRCLE!!!
        // Customize the appearance of the shape layer
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = view.tintColor.CGColor
        shape.lineWidth = 5.0
        
        // Make a rect to draw our shape in
        let rect = CGRectMake(0.0, 0.0, 100.0, 100.0)
        
        // Set the path for the shape layer
        shape.path = UIBezierPath(ovalInRect: rect).CGPath
        
        // Add the shape layer as a sub layer of our view
        //circleView.layer.addSublayer(shape)
        
        
        // Inner arc
        progress.fillColor = UIColor.clearColor().CGColor
        progress.strokeColor = UIColor.orangeColor().CGColor
        progress.lineWidth = shape.lineWidth
        progress.path = UIBezierPath(ovalInRect: rect).CGPath
        view.layer.addSublayer(progress)
        
        // Animate the shape change
        let duration = NSNumber(float: 2.0)
        var newAnimation = CABasicAnimation(keyPath: "strokeEnd")
        newAnimation.fromValue = NSNumber(float: 0.0)
        newAnimation.toValue = NSNumber(float:1.0)
        newAnimation.duration = 4.0
        newAnimation.delegate = self
        newAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        progress.addAnimation(newAnimation, forKey: "strokeEnd Animation")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
