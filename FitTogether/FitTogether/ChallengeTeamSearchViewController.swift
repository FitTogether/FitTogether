//
//  ChallengeTeamSearchViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class ChallengeTeamSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var teamData = TeamData()
    var fakeData:[(name: String, amtOfStepsWalked: String)]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fakeData = teamData.passArrayOfData()
        //var ckHelper = CloudKitHelper()
        //var userArray: AnyObject = ckHelper.retriveRecords("ID", queryRecordType: "Team")
        //NSLog("Elements in array: \(userArray)")
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
        return fakeData!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("teamCell") as UITableViewCell
        
        let item = self.fakeData![indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.amtOfStepsWalked
        
        // var imageName = UIImage(named: fakeData[indexPath.row])
        var imageName = UIImage(named: "theDude.png")
        cell.imageView?.image = imageName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //load profile
    }
}