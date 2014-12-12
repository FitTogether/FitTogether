//
//  NavUISearchDisplayController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/12/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class NavUISearchDisplayController: UISearchDisplayController {
    
    override func setActive(visible: Bool, animated: Bool) {
        super.setActive(visible, animated: animated)
        self.searchContentsController.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
