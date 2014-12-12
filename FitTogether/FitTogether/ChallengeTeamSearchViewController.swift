//
//  ChallengeTeamSearchViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit

class ChallengeTeamSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate, UISearchDisplayController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityBar: UIActivityIndicatorView!

    var delegate: CloudKitQuery?
    
    var teams = [Team]()

    var teamData = TeamData()
    var filteredTeamData = [Team]()
    var fakeData:[(name: String, amtOfStepsWalked: String)]?
    
    var ck = CloudKitHelper()
    var ckData: AnyObject?
    
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
        ckData = ck.retriveRecords("Name", queryRecordType: "Team", completionHandler: { (ckData: [AnyObject]!) -> Void in
            for data: CKRecord in ckData as [CKRecord] {
                var team = Team(name: "", steps: 0)
                if let name: String = data.objectForKey("Name") as? String {
                    team.name = data.objectForKey("Name") as? String
                    println(team.name?)
                }
                if let steps: Int = data.objectForKey("Steps") as? Int {
                    team.steps = data.objectForKey("Steps") as? Int
                }
                self.teams.append(team)
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
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredTeamData.count
        } else {
            return self.teams.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        var item : Team
        if tableView == self.searchDisplayController?.searchResultsTableView {
            item = filteredTeamData[indexPath.row]
        } else {
            item = teams[indexPath.row]
        }
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.steps!)"
        
        
        //var imageName = UIImage(named: fakeData[indexPath.row])
        //var imageName = UIImage(named: "theDude.png")
        //cell.imageView?.image = imageName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //load profile
    }
    
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredTeamData = self.teams.filter({( team: Team) -> Bool in
            let stringMatch = team.name?.rangeOfString(searchText)
            return (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
}