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
    let progressLayer = CAShapeLayer()
    let steps = 4532
    
    //function that converts degrees to radians
    func DegreesToRadians (value:Float) -> Float {
        return value * Float(M_PI) / 180.0
    }
    
    @IBOutlet weak var avgStepView: UIView!
   
    @IBOutlet weak var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Calculate frames bounds
        let frameWidth = circleView.frame.width
        println(frameWidth)
        let frameHeight = circleView.frame.height
        let lineWidth: CGFloat = 30
        let rectSize: CGFloat = 120
        let offsetX = ((frameWidth/2) - (rectSize) + 10)
        let offsetY = (frameHeight/2)
        
        //CIRCLE!!!
        // Customize the appearance of the shape layer
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = view.tintColor.CGColor
        shape.lineWidth = lineWidth
        
        // Make a rect to draw our shape in
        let rect = CGRectMake(0, 0, rectSize, rectSize)
        
        // Set the path for the shape layer
        let pi = (2 * CGFloat(M_PI) * 1 - CGFloat(M_PI_2))
        let fullEndAngle = CGFloat(M_PI + (M_PI/2))
        let progressBar = fullEndAngle * 0.75

        //Note the offsets are completely not dynamic and work mainly on iPhone 6
        var path = UIBezierPath(arcCenter: CGPointMake(offsetX, offsetY), radius: rectSize as CGFloat, startAngle: pi, endAngle: progressBar , clockwise: true)

        
        // Add the shape layer as a sub layer of our view
        circleView.layer.addSublayer(shape)
        
        //Shape Constraints
        shape.frame = self.circleView.layer.frame
        
        // Inner arc
        progress.fillColor = UIColor.clearColor().CGColor
        progress.strokeColor = UIColor.orangeColor().CGColor
        progress.lineWidth = shape.lineWidth
        progress.path = path.CGPath
        //fill in our circle
        circleView.layer.addSublayer(progress)
        
        // Animate the shape change
        //let duration = NSNumber(float: 2.0)
        var newAnimation = CABasicAnimation(keyPath: "strokeEnd")
        newAnimation.duration = 8.0
        newAnimation.removedOnCompletion = false
        newAnimation.fromValue = NSNumber(float: 0)
        newAnimation.toValue = NSNumber(float: 1.0)
        newAnimation.delegate = self
        newAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        progress.addAnimation(newAnimation, forKey: "strokeEnd Animation")
        
        
        //Label Animation
        let interval = Double(8/steps)
        NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "update", userInfo: nil, repeats: true)
        
        
        // Do any additional setup after loading the view.
//        
//        CAShapeLayer *circle=[CAShapeLayer layer];
//        circle.path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(29, 29) radius:27 startAngle:2*M_PI*0-M_PI_2 endAngle:2*M_PI*1-M_PI_2 clockwise:YES].CGPath;
//        circle.fillColor=[UIColor clearColor].CGColor;
//        circle.strokeColor=[UIColor greenColor].CGColor;
//        circle.lineWidth=4;
//        
//        CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//        animation.duration=10;
//        animation.removedOnCompletion=NO;
//        animation.fromValue=@(0);
//        animation.toValue=@(1);
//        animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//        [circle addAnimation:animation forKey:@"drawCircleAnimation"];
//        
//        [imageCircle.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
//        [imageCircle.layer addSublayer:circle];
        
        //var user = User()
        
    }
    
    @IBOutlet weak var stepsLabel: UILabel!
    func update() {
        if var stepNum = stepsLabel.text?.toInt() {
            if stepNum <= steps {
                stepNum = stepNum + 1
                stepsLabel.text = "\(stepNum)"
            }
        }
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
