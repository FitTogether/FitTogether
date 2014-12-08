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
    
    var fakeData = ["Beer", "Eggs", "Milk", "Beer", "Steak", "Beer", "The Lord of the Rings on Blu-Ray", "Beer", "98˚ Greatest Hits Album", "Chicken", "Beer", "Beer", "Beer", "Beer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        return fakeData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel.text = self.fakeData[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //load profile
    }
    
    
    /* Segmented Control */
    //
    @IBAction func segmentedControl_Tapped(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            //List users by A - Z
            //same view with data loaded differently
            var sortedFakeData = fakeData.sorted { $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending}
            fakeData = sortedFakeData
            self.tableView.reloadData()
            
        case 1:
            //List users by Most Steps
            //Call model?
            //load table view here?
            tableView.reloadData()
        case 2:
            //List users by Least Steps
            //Call model?
            //load table view here
            tableView.reloadData()
        default:
            break
            
        }
}

}