//
//  profileViewController.swift
//  Dashboard
//
//  Created by CJ Voege on 11/17/14.
//  Copyright (c) 2014 CJ Voege. All rights reserved.
//
// TEST COMMETIRWJO
//
//  profileViewController.swift
//  Dashboard
//
//  Created by Matthew Whitesides on 12/09/14.
//  Copyright (c) 2014 Matthew Whitesides. All rights reserved.
//
// TEST COMMETIRWJO

import UIKit
import CloudKit
import HealthKit

class profileViewController: UIViewController {
    
    let blueColor = UIColor(red: (33/355), green: (150/255), blue: (243/255), alpha: 0.9).CGColor
    //let orangeColor = UIColor(red: 0.90, green: 0.20, blue: 0.15, alpha: 0.8).CGColor
    
    //insert team data
    var teamData = TeamData()
    let ck = CloudKitHelper()
    let hk = HealthKitData()
    var me = User(name: "", steps: 0, pic: nil)
    var fakeData:[(name: String, amtOfStepsWalked: String)]?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstBadgeView: UIView!
    @IBOutlet weak var secondBadgeView: UIView!
    @IBOutlet weak var thirdBadgeView: UIView!
    @IBOutlet weak var fourthBadgeView: UIView!
    
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        loadCloudKitData()
        constrainBadgeBoxes()
        fakeData = teamData.passArrayOfData()//for TeamDataViewController didSelectAtIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Creates Circle and mask around profile pic
    func initProfilePic() {
        //Rounded Border
        nameLabel.text = me.name!
        teamLabel.text = me.team!
        stepsLabel.text = "\(me.steps!)"
        if let image = me.pic? {
            imageView.image = me.pic!
        }
        imageView.backgroundColor = UIColor.clearColor()
        imageView.layer.cornerRadius = (imageView.frame.height/2)
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = blueColor
        imageView.layer.masksToBounds = true
    }
    
    //Dynamic constraints around bade containers
    func constrainBadgeBoxes() {
        //Calculate gray box sizes
        firstBadgeView.addConstraint(NSLayoutConstraint(item: firstBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        secondBadgeView.addConstraint(NSLayoutConstraint(item: secondBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        thirdBadgeView.addConstraint(NSLayoutConstraint(item: thirdBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute:
        .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
        fourthBadgeView.addConstraint(NSLayoutConstraint(item: fourthBadgeView, attribute: NSLayoutAttribute.Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: (self.view.bounds.width/4)))
    }
    
    //Displays a given alert (Note: Not currently used)
    func displayAlertWithTitle(title: String, message: String){
        let controller = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "OK",
            style: .Default,
            handler: nil))
        
        presentViewController(controller, animated: true, completion: nil)
        
    }
    
    //Load Cloud Kit Data For Given User
    func loadCloudKitData() {
        activityIndicator.startAnimating()
        ck.getUserName({ (name: String) -> Void in
            if self.me.name == "" {
                self.me.name = name
            }
            self.ck.retriveRecords("Name", queryRecordType: "User", completionHandler: { (ckData: [AnyObject]!) -> Void in
                var check = false
                for data: CKRecord in ckData as [CKRecord] {
                    var user = User(name: "", steps: 0, pic: nil)
                    if let name: String = data.objectForKey("Name") as? String {
                        user.name = data.objectForKey("Name") as? String
                    }
                    if let team: String = data.objectForKey("Team") as? String {
                        user.team = data.objectForKey("Team") as? String
                    }
                    if let steps: Int = data.objectForKey("Steps") as? Int {
                        user.steps = data.objectForKey("Steps") as? Int
                    }
                    
                    let pic = data.objectForKey("Picture") as CKAsset!
                    if let asset = pic {
                        if let url = asset.fileURL {
                            let imageData = NSData(contentsOfFile: url.path!)!
                            user.pic = UIImage(data: imageData)
                        }
                    }
                    if user.name == self.me.name {
                        check = true
                        self.hk.queryLastMonthsHealthKitSteps({ (ckData: [AnyObject]!) -> Void in
                            var stepsYesterday = 0.0
                            for dataPoint: HKQuantitySample in ckData as [HKQuantitySample]{
                                let quantity: Double = dataPoint.quantity.doubleValueForUnit(HKUnit.countUnit())
                                stepsYesterday = stepsYesterday + quantity
                            }
                            self.me.steps = Int(stepsYesterday)
                            self.me.pic = user.pic
                            self.me.team = user.team!
                            self.initProfilePic()
                            self.activityIndicator.stopAnimating()
                        })
                    }
                }
                if check == false {
                    self.ck.saveRecord(self.me.name!, tableName: "User", forKey: "Name", isPrivate: false)
                    self.me.steps = 0
                    self.me.team = "Flying Solo"
                    self.initProfilePic()
                    self.activityIndicator.stopAnimating()
                }
            })
            
        })


    }
}
