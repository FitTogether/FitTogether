//
//  JoinTeamViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/13/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit

class JoinTeamViewController: UIViewController {
    
    let ck = CloudKitHelper()
    @IBOutlet weak var teamCodeInputBox: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goButtonPressed(sender: AnyObject) {
        var input = teamCodeInputBox.text!
        activityIndicator.startAnimating()
        ck.getUserName({ (name) -> Void in
            self.ck.retriveRecords((input), completionHandler: { (preposedTeamRecord: CKRecord) -> Void in
                if preposedTeamRecord.recordType != "Error" {
                    self.ck.retriveRecords((name), completionHandler: { (record: CKRecord) -> Void in
                        record.setValue(input, forKey: "Team")
                        self.ck.updateRecord(record, callback: { (success) -> () in
                            if success == true {
                                self.welcomeLabel.text = "Welcome to team \(input)"
                            }
                        })
                    })
                } else {
                    self.welcomeLabel.text = "Sorry Team Does Not Exist"
                }
                self.activityIndicator.stopAnimating()
            })
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
