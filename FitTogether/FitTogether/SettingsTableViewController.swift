//
//  SettingsTableViewController.swift
//  fittogethertwo
//
//  Created by Justin Schubring on 12/14/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit

class SettingsTableViewController: UITableViewController {

  let ck = CloudKitHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leaveTeam_Tapped(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Are you sure you want to leave team?", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        // Create the actions
        var okAction = UIAlertAction(title: "Leave Team", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Leave Pressed")
            
           /* ck.getUserName({ (name) -> Void in
                self.ck.retriveRecords((name), completionHandler: { (preposedTeamRecord: CKRecord) -> Void in
                    if preposedTeamRecord.recordType != "Error" {
                        self.ck.retriveRecords((name), completionHandler: { (record: CKRecord) -> Void in
                            record.setValue(input, forKey: "Team")
                            self.ck.updateRecord(record, callback: { (success) -> () in
                                if success == true {
                                    NSLog("Leave team success")
                                }
                            })
                        })
                    } else {
                        NSLog("Unable to leave team")
                    }
                })
            })*/
            
            NSLog("Leave Complete")
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
//
    }
}
