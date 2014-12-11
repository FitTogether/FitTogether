//
//  profileViewController.swift
//  Dashboard
//
//  Created by CJ Voege on 11/17/14.
//  Copyright (c) 2014 CJ Voege. All rights reserved.
//
// TEST COMMETIRWJO

import UIKit

class profileViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstBadgeView: UIView!
    @IBOutlet weak var secondBadgeView: UIView!
    @IBOutlet weak var thirdBadgeView: UIView!
    @IBOutlet weak var fourthBadgeView: UIView!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var firstBadge: UIImageView!
    @IBOutlet weak var secondBadge: UIImageView!
    @IBOutlet weak var thirdBadge: UIImageView!
    @IBOutlet weak var fourthBadge: UIImageView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //var orangeColor = UIColor(red: 0.90, green: 0.20, blue: 0.15, alpha: 0.8).CGColor
        var blueColor = UIColor(red: (33/355), green: (150/255), blue: (243/255), alpha: 0.9).CGColor
        
        //Rounded Border
        imageView.backgroundColor = UIColor.clearColor()
        imageView.layer.cornerRadius = (imageView.frame.height/2)
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = blueColor
        imageView.layer.masksToBounds = true
    
//        CALayer             *layer = [CALayer layer];
//        CGRect              bounds = self.bounds;
//        
//        layer.bounds = bounds;
//        layer.position = CGPointMake(bounds.size.width / 2 + 3, bounds.size.height / 2 + 3);
//        layer.backgroundColor = [UIColor colorWithWhite: 0.25 alpha: 0.55].CGColor;
//        layer.zPosition = -5;
//        
//        [self.layer addSublayer: layer];
        
        
        //Shadow
//        teamLabel.layer.shadowColor = orangeColor
//        teamLabel.layer.shadowOffset = CGSizeMake(0, 1);
//        teamLabel.layer.shadowOpacity = 1;
//        teamLabel.layer.shadowRadius = 10;
//        teamLabel.clipsToBounds = false

        //Calculate gray box sizes
        firstBadgeView.addConstraint(NSLayoutConstraint(item: firstBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        secondBadgeView.addConstraint(NSLayoutConstraint(item: secondBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        thirdBadgeView.addConstraint(NSLayoutConstraint(item: thirdBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute:
            .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        fourthBadgeView.addConstraint(NSLayoutConstraint(item: fourthBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func viewDidAppear(animated: Bool) {
//        firstLabel.addConstraint(NSLayoutConstraint(item: firstLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: .Equal, toItem: firstBadgeView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
//        firstLabel.addConstraint(NSLayoutConstraint(item: firstLabel, attribute: NSLayoutAttribute.Left, relatedBy: .Equal, toItem: firstBadgeView, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1.0, constant: 0.0))
//        firstLabel.addConstraint(NSLayoutConstraint(item: firstLabel, attribute: NSLayoutAttribute.Right, relatedBy: .Equal, toItem: firstBadgeView, attribute: NSLayoutAttribute.RightMargin, multiplier: 1.0, constant: 0.0))
//        
//        
//        firstBadge.addConstraint(NSLayoutConstraint(item: firstBadge, attribute: NSLayoutAttribute.Bottom, relatedBy: .Equal, toItem: firstLabel, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 0.0))
//        firstBadge.addConstraint(NSLayoutConstraint(item: firstBadge, attribute: NSLayoutAttribute.Left, relatedBy: .Equal, toItem: firstBadgeView, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1.0, constant: 0.0))
//        firstBadge.addConstraint(NSLayoutConstraint(item: firstBadge, attribute: NSLayoutAttribute.Right, relatedBy: .Equal, toItem: firstBadgeView, attribute: NSLayoutAttribute.RightMargin, multiplier: 1.0, constant: 0.0))
        
        
        
//        badgeLabelConstraintGenerator(&firstLabel, view: &firstBadgeView)
//        badgeLabelConstraintGenerator(secondLabel, view: secondBadgeView)
//        badgeLabelConstraintGenerator(thirdLabel, view: thirdBadgeView)
//        badgeLabelConstraintGenerator(fourthLabel, view: fourthBadgeView)
        
//        badgeIconConstraintGenerator(&firstBadge, view: &firstBadgeView, label: &firstLabel)
//        badgeIconConstraintGenerator(secondBadge, view: secondBadgeView, label: secondLabel)
//        badgeIconConstraintGenerator(thirdBadge, view: thirdBadgeView, label: thirdLabel)
//        badgeIconConstraintGenerator(fourthBadge, view: fourthBadgeView, label: fourthLabel)
//    }
//    
//    func displayAlertWithTitle(title: String, message: String){
//        let controller = UIAlertController(title: title,
//            message: message,
//            preferredStyle: .Alert)
//        
//        controller.addAction(UIAlertAction(title: "OK",
//            style: .Default,
//            handler: nil))
//        
//        presentViewController(controller, animated: true, completion: nil)
//        
//    }
//    
//    func badgeIconConstraintGenerator(inout badge: UIImageView!, inout view: UIView!, inout label: UILabel!) {
//        badge.addConstraint(NSLayoutConstraint(item: badge, attribute: NSLayoutAttribute.Bottom, relatedBy: .Equal, toItem: label, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: 0.0))
//        badge.addConstraint(NSLayoutConstraint(item: badge, attribute: NSLayoutAttribute.Left, relatedBy: .Equal, toItem: view, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1.0, constant: 0.0))
//        badge.addConstraint(NSLayoutConstraint(item: badge, attribute: NSLayoutAttribute.Right, relatedBy: .Equal, toItem: view, attribute: NSLayoutAttribute.RightMargin, multiplier: 1.0, constant: 0.0))
//    }
//
//    func badgeLabelConstraintGenerator(inout label: UILabel!, inout view: UIView!) {
//        label.addConstraint(NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Bottom, relatedBy: .Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
//        label.addConstraint(NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: .Equal, toItem: view, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1.0, constant: 0.0))
//        label.addConstraint(NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Right, relatedBy: .Equal, toItem: view, attribute: NSLayoutAttribute.RightMargin, multiplier: 1.0, constant: 0.0))
//    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

}
