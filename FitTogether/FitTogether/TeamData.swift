//
//  TeamData.swift
//  fittogethertwo
//
//  Created by Justin Schubring on 12/8/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class TeamData: NSObject {
    
    //grab team data for iCloud
    //store team data into array?
    
    var userData:[(name: String, amtOfStepsWalked: Int)] = []
    
    
    override init() {
        userData.append(name: "Justin Schubring", amtOfStepsWalked: 4000)
        userData.append(name: "John Doe", amtOfStepsWalked: 3456)
        userData.append(name: "John Snow", amtOfStepsWalked: 12345)
        userData.append(name: "Alan Rickman", amtOfStepsWalked: 0001)
        super.init()
    }
    
    
    //func to sort team members by A - Z
    //func will return array of sorted team members to be used by controller
    func AtoZ(inArray:[(name: String, amtOfStepsWalked: Int)]) -> [(name: String, amtOfStepsWalked: Int)]{
        var anArray = inArray
        anArray.sort {$0.name != $1.name ? $0.name < $1.name : $0.name > $1.name}
        return anArray
    }
    
    //func to sort team members by steps high - low
    //func will return array of sorted team members to be used by controller
    func HighToLow(inArray:[(name: String, amtOfStepsWalked: Int)]) -> [(name: String, amtOfStepsWalked: Int)]{
        var anArray = inArray
        anArray.sort {$0.1 != $1.1 ? $0.1 > $1.1 : $0.0 < $1.0}
        return anArray
    }
    //func to sort team members by steps low - high
    //func will return array of sorted team members to be used by controller
    func LowToHigh(inArray:[(name: String, amtOfStepsWalked: Int)]) -> [(name: String, amtOfStepsWalked: Int)]{
        var anArray = inArray
        anArray.sort {$0.1 != $1.1 ? $0.1 < $1.1 : $0.0 > $1.0}
        return anArray
    }
    
}
