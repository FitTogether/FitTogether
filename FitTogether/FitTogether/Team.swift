//
//  Team.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/11/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import Foundation

class Team {
    var name: String?
    var steps: Int?
    var description : String?
    
    init(name: String, steps: Int) {
        self.name = name
        self.steps = steps
    }
    
    init(name: String, description: String){
        self.name = name
        self.description = description
        self.steps = 0
    }
}