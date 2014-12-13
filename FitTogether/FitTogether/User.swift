//
//  User.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/6/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit
import CloudKit
import Foundation

class User {
    
    var name: String?
    var steps: Int?
    var pic: UIImage?
    
    init(name: String, steps: Int, pic: UIImage?) {
        self.name = name
        self.steps = steps
        self.pic = pic
    }
    
}
