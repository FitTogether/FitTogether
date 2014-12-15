//
//  ChallengeTeamViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit

class ChallengeTeamViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lengthInput: UITextField!
    let ck = CloudKitHelper()
    var team = Team(name: "", steps: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = team.name!
        
        // Do any additional setup after loading the view.
    }

    func challengeTeam() {
        var input = lengthInput.text!
        var myTeam = ""
        activityIndicator.startAnimating()
        ck.getUserName({ (name) -> Void in
            self.ck.retriveRecords(name, completionHandler: {(record: CKRecord) -> Void in
                myTeam = (record.objectForKey("Team")) as NSString
                self.ck.retriveRecords(myTeam, completionHandler: { (preposedTeamRecord: CKRecord) -> Void in
                    if preposedTeamRecord.recordType != "Error" {
                        self.ck.retriveRecords((myTeam), completionHandler: { (record: CKRecord) -> Void in
                            record.setValue(self.team.name!, forKey: "Opponent")
                            self.ck.updateRecord(record, callback: { (success) -> () in
                                if success == true {
                                    self.welcomeLabel.text = "Challenging Team, \(self.team.name!)"
                                }
                            })
                        })

                    } else {
                        self.welcomeLabel.text = "Sorry Team Can't Be Challenged"
                    }
                    self.activityIndicator.stopAnimating()
                })
            })
        })
    }
    
    @IBAction func challengeTeamPressed(sender: AnyObject) {
        challengeTeam()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
