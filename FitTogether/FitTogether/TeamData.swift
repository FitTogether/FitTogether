//
//  TeamData.swift
//  fittogethertwo
//
//  Created by Justin Schubring on 12/8/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class TeamData: NSObject {
    
    var ckHelper = CloudKitHelper()
    
    override init() {
        
        ckHelper.retriveRecords("ID", queryRecordType: "Team")
        super.init()
    }
    
    
    func passArrayOfData()-> [(name: String, amtOfStepsWalked: Int)]{
        
        var anArray:[(name: String, amtOfStepsWalked: Int)] = [(name: "Bart", amtOfStepsWalked: 2000), (name: "Adam", amtOfStepsWalked: 3000), (name: "Chris", amtOfStepsWalked: 1000), (name: "Dave", amtOfStepsWalked: 5000), (name: "Justin", amtOfStepsWalked: 4000), (name: "Scott", amtOfStepsWalked: 9000), (name: "Pete", amtOfStepsWalked: 8000), (name: "Matt", amtOfStepsWalked: 9000), (name: "Tyler", amtOfStepsWalked: 0), (name: "Aaron", amtOfStepsWalked: 11000), (name: "Jill", amtOfStepsWalked: 6000), (name: "Jack", amtOfStepsWalked: 4000), (name: "Frank", amtOfStepsWalked: 1000), (name: "Tim", amtOfStepsWalked: 4000)]
        
        return anArray
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
