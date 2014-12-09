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
    
    var fakeData = ["Bart", "Adam", "Chris", "Dave", "Justin", "Scott", "Pete", "Matt", "Tyler", "Aaron", "Jill", "Jack", "Frank", "Tim"]
    
    var fakeSteps = ["2000", "3000", "1000", "5000", "4000", "9000", "8000", "9000", "0", "11000", "7000", "4000", "6000", "4000"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel.text = self.fakeData[indexPath.row]
        
       // var imageName = UIImage(named: fakeData[indexPath.row])
        var imageName = UIImage(named: "theDude.png")
        cell.imageView.image = imageName
        
        cell.detailTextLabel?.text = self.fakeSteps[indexPath.row]
        
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