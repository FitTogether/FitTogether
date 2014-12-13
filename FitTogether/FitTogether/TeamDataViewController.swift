//
//  TeamDataViewController.swift
//  fittogethertwo
//
//  Created by Justin Schubring on 12/8/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit

class TeamDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityBar: UIActivityIndicatorView!
    
    
    var teamData = TeamData()
    var fakeData:[(name: String, amtOfStepsWalked: String)]?
    
    var ck = CloudKitHelper()
    var ckData: AnyObject?
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //fakeData = teamData.passArrayOfData()
        loadDataFromCloudKit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDataFromCloudKit() {
        self.activityBar.startAnimating()
        ckData = ck.retriveRecords("Name", queryRecordType: "User", completionHandler: { (ckData: [AnyObject]!) -> Void in
            for data: CKRecord in ckData as [CKRecord] {
                var user = User(name: "", steps: 0, pic: nil)
                if let name: String = data.objectForKey("Name") as? String {
                    user.name = data.objectForKey("Name") as? String
                    println(user.name?)
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

                self.users.append(user)
                dispatch_sync(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                    self.activityBar.stopAnimating()
                });
            }
        })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return fakeData.count
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        //let item = self.fakeData![indexPath.row]
        let item = self.users[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.steps!)"
        
        // var imageName = UIImage(named: fakeData[indexPath.row])
        //var imageName = UIImage(named: "theDude.png")
        cell.imageView?.image = item.pic
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //load profile
        let teamMember = self.fakeData![indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let teamMemberProfile = storyboard.instantiateViewControllerWithIdentifier("profile") as profileViewController
        
        let teamMemberData = fakeData
        teamMemberProfile.fakeData = teamMemberData
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.navigationController?.pushViewController(teamMemberProfile, animated: true)
    }

    @IBAction func segmentedControl_Tapped(sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            //List users by A - Z
            fakeData = teamData.AtoZ()
            self.tableView.reloadData()
            
        case 1:
            //List users by Most Steps
            fakeData = teamData.HighToLow()
            tableView.reloadData()
        case 2:
            //List users by Least Steps
            fakeData = teamData.LowToHigh()
            tableView.reloadData()
        default:
            break
            
        }
    }
}