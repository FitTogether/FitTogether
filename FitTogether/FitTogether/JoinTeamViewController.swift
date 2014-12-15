//
//  JoinTeamViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/13/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class JoinTeamViewController: UIViewController {
    
    let ck = CloudKitHelper()
    @IBOutlet weak var teamCodeInputBox: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goButtonPressed(sender: AnyObject) {
        ck.getUserName({ (name) -> Void in
            self.ck.modifyRecord(self.teamCodeInputBox.text, tableName: "User", forKey: "Team", recordId: name, isPrivate: false)
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
