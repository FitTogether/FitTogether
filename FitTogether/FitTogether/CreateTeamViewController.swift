//
//  CreateTeamViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/7/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit

class CreateTeamViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var teamCreatedLabel: UILabel!
    @IBOutlet weak var teamCreatedDescription: UILabel!
    
    @IBOutlet weak var teamCreatedAcitivityIcon: UIActivityIndicatorView!
    
    let ck = CloudKitHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamCreatedLabel.text = ""
        teamCreatedDescription.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == self.descriptionTextField) {
            textField.resignFirstResponder()
        } else if (textField == self.teamNameTextField) {
            self.descriptionTextField.becomeFirstResponder()
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Create a variable that you want to send
        var teamData = Team(name: teamNameTextField.text, description: descriptionTextField.text)
        
        // Create a new variable to store the instance of TeamCreatedInfo
        let destinationVC = segue.destinationViewController as TeamCreatedInfoViewController
        destinationVC.teamData = teamData
    }
    
    @IBAction func createTeamPressed(sender: AnyObject) {
        teamNameTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
        
        //save record with cloudkit
        self.teamCreatedAcitivityIcon.startAnimating()
        ck.saveRecord(self.teamNameTextField.text, tableName: "Team", forKey: "Name", recordId: self.teamNameTextField.text, isPrivate: false, completionHandler: {(record : CKRecord) -> Void in
            if (record.recordType == "Error") {
                
                self.teamCreatedLabel.text = "ERROR"
                self.teamCreatedAcitivityIcon.stopAnimating()
            } else {
                // Create a variable that you want to send
                self.teamCreatedAcitivityIcon.stopAnimating()
               // self.performSegueWithIdentifier("TeamInfoSegue", sender: self)
            }
        })
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
