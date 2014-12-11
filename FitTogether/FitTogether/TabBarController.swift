//
//  TabBarController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var teamName: NSString?
    var teamDesc: NSString?
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamDescLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD:FitTogether/FitTogether/TeamCreatedViewController.swift
        
        teamNameLabel.text = teamName
        teamDescLabel.text = teamDesc
=======

        //Starts at middle tab
        self.selectedIndex = 1
        
>>>>>>> FETCH_HEAD:FitTogether/FitTogether/TabBarController.swift
        // Do any additional setup after loading the view.
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
