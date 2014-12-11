//
//  TeamDataViewController.swift
//  fittogethertwo
//
//  Created by Justin Schubring on 12/8/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class TeamDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
<<<<<<< HEAD
    var teamData = TeamData()
    
    //var fakeData = TeamData.passArrayOfData()
 /*   var fakeData = ["Bart", "Adam", "Chris", "Dave", "Justin", "Scott", "Pete", "Matt", "Tyler", "Aaron", "Jill", "Jack", "Frank", "Tim"]
    
    var fakeSteps = ["2000", "3000", "1000", "5000", "4000", "9000", "8000", "9000", "0", "11000", "7000", "4000", "6000", "4000"]
=======
    
    var teamData = TeamData()
    var fakeData:[(name: String, amtOfStepsWalked: String)]?
>>>>>>> FETCH_HEAD
    
  */
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        var ckHelper = CloudKitHelper()
        var userArray: AnyObject = ckHelper.retriveRecords("ID", queryRecordType: "Team")
        NSLog("Elements in array: \(userArray)")
=======
        fakeData = teamData.passArrayOfData()
        //var ckHelper = CloudKitHelper()
        //var userArray: AnyObject = ckHelper.retriveRecords("ID", queryRecordType: "Team")
        //NSLog("Elements in array: \(userArray)")
>>>>>>> FETCH_HEAD
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return fakeData.count
<<<<<<< HEAD
        //return teamData.userData.count
        return 1
=======
        return fakeData!.count
>>>>>>> FETCH_HEAD
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
<<<<<<< HEAD
        
     //   cell.textLabel.text = self.fakeData[indexPath.row]
       //cell.textLabel.text = self.teamData.userData[indexPath.row]
=======
>>>>>>> FETCH_HEAD
        
        let item = self.fakeData![indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.amtOfStepsWalked
        
        // var imageName = UIImage(named: fakeData[indexPath.row])
        var imageName = UIImage(named: "theDude.png")
<<<<<<< HEAD
        //cell.imageView.image = imageName
        
     //   cell.detailTextLabel?.text = self.fakeSteps[indexPath.row]
=======
        cell.imageView?.image = imageName
        
>>>>>>> FETCH_HEAD
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //load profile
    }

    @IBAction func segmentedControl_Tapped(sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            //List users by A - Z
<<<<<<< HEAD
            //same view with data loaded differently
            //var sortedFakeData = fakeData.sorted { $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending}
            //fakeData = sortedFakeData
=======
            fakeData = teamData.AtoZ()
>>>>>>> FETCH_HEAD
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