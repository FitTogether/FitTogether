//
//  JoinTeamViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/7/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class JoinTeamViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamCode: UILabel!
    @IBOutlet weak var teamDesc: UITextView!
    @IBOutlet weak var codeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamCode.text = "Team Code"
        teamName.text = ""
        teamDesc.text = ""

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        teamCode.text = codeTextField.text
        teamName.text = "Mizzou IT 4500 Team Zulu"
        teamDesc.text = "We are the team of Mizzou students in the Mobile App Dev IT4500 Columbia, MO"
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
