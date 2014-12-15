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

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leaveTeam_Tapped(sender: AnyObject) {
        
        ck.getUserName({ (name) -> Void in
            self.ck.retriveRecords((input), completionHandler: { (preposedTeamRecord: CKRecord) -> Void in
                if preposedTeamRecord.recordType != "Error" {
                    self.ck.retriveRecords((name), completionHandler: { (record: CKRecord) -> Void in
                        record.setValue(input, forKey: "Team")
                        self.ck.updateRecord(record, callback: { (success) -> () in
                            if success == true {
                                self.welcomeLabel.text = "Welcome to team \(name)"
                            }
                        })
                    })
                } else {
                    self.welcomeLabel.text = "Sorry Team Does Not Exist"
                }
            })
        })
    }
}
