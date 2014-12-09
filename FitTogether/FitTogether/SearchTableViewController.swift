//
//  SearchTableViewController.swift
//  FitTogether
//
//  Created by Tyron Allen on 12/9/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

var arrayObject = arrayData()

class SearchTableViewController: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return arrayObject .MyArray().count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell:MyTableViewCell =
                tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
                as MyTableViewCell

        // Configure the cell...
        cell.MyLabel.text = (arrayObject .MyArray() .objectAtIndex(indexPath.row)) as? String
        
        return cell
    }
    


}
