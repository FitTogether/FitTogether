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

    }
    
    override func viewDidAppear(animated: Bool) {
        loadDataFromCloudKit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*need to move to TeamData.swift*/
    
    
    func loadDataFromCloudKit() {
        self.activityBar.startAnimating()
        
        ck.getUserName( { (userName) -> Void in
            self.ck.retriveRecords(userName, completionHandler: { (record) -> Void in
                if let myTeam = record.objectForKey("Team") as? String {
                    self.teamNameLabel.text = myTeam
                    self.ckData = self.ck.retriveRecords("Name", queryRecordType: "User", completionHandler: { (ckData: [AnyObject]!) -> Void in
                        for data: CKRecord in ckData as [CKRecord] {
                            var user = User(name: "", steps: 0, pic: nil)
                            var onMyTeam = ""
                            if let name: String = data.objectForKey("Name") as? String {
                                user.name = name
                            }
                            if let steps: Int = data.objectForKey("Steps") as? Int {
                                user.steps = steps
                            }
                            if let team: String = data.objectForKey("Team") as? String {
                                onMyTeam = team
                            }
                            let pic = data.objectForKey("Picture") as CKAsset!
                            if let asset = pic {
                                if let url = asset.fileURL {
                                    let imageData = NSData(contentsOfFile: url.path!)!
                                    user.pic = UIImage(data: imageData)
                                }
                            }
                            
                            if myTeam == onMyTeam {
                                self.users.append(user)
                            }
                            dispatch_sync(dispatch_get_main_queue(), {
                                self.tableView.reloadData()
                                self.activityBar.stopAnimating()
                            });
                        }
                    })
                }
            })
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
        let teamMember = self.users[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let teamMemberProfile = storyboard.instantiateViewControllerWithIdentifier("profile") as profileViewController
        
        teamMemberProfile.me.pic = teamMember.pic
        teamMemberProfile.me.name = teamMember.name
        teamMemberProfile.me.steps = teamMember.steps
        teamMemberProfile.me.team = teamMember.team
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.navigationController?.pushViewController(teamMemberProfile, animated: true)
    }

    @IBAction func segmentedControl_Tapped(sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            //List users by A - Z
            users = AtoZ()
            self.tableView.reloadData()
            
        case 1:
            //List users by Most Steps
            users = HighToLow()
            tableView.reloadData()
        case 2:
            //List users by Least Steps
            users = LowToHigh()
            tableView.reloadData()
        default:
            break
            
        }
    }
    
    //func to sort team members by A - Z
    //func will return array of sorted team members to be used by controller
    func AtoZ() -> [User] {
        var anArray = users
        anArray.sort {$0.name != $1.name ? $0.name < $1.name : $0.name > $1.name}
        return anArray
    }
    
    //func to sort team members by steps high - low
    //func will return array of sorted team members to be used by controller
    func HighToLow() -> [User] {
        var anArray = users
        anArray.sort {$0.steps != $1.steps ? $0.steps > $1.steps : $0.steps < $1.steps}
        return anArray
    }
    
    //func to sort team members by steps low - high
    //func will return array of sorted team members to be used by controller
    func LowToHigh() -> [User] {
        var anArray = users
        anArray.sort {$0.steps != $1.steps ? $0.steps < $1.steps : $0.steps < $1.steps}
        return anArray
    }
    
}