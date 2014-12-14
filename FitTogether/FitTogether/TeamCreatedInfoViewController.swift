//
//  TeamCreatedInfoViewController.swift
//  fittogethertwo
//
//  Created by Justin Schubring on 12/14/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit

class TeamCreatedInfoViewController: UIViewController {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamDesc: UITextView!
    @IBOutlet weak var teamCode: UILabel!
    
    var teamData : Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamName.text = teamData?.name
        teamDesc.text = teamData?.description
        // Do any additional setup after loading the view.
    }
    
}
