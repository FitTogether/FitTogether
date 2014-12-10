//
//  CreateTeamViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/7/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class CreateTeamViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let teamName = teamNameTextField.text as NSString
        let description = descriptionTextField.text as NSString
        
        var teamCreated = segue.destinationViewController as TeamCreatedViewController
        teamCreated.teamDesc = description
        teamCreated.teamName = teamName
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == self.descriptionTextField) {
            textField.resignFirstResponder()
        } else if (textField == self.teamNameTextField) {
            self.descriptionTextField.becomeFirstResponder()
        }
        return true
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
