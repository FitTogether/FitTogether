//
//  HealthKitHelper.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/6/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitHelper {
    
    let weightType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
    let weightValue = HKQuantity(unit: HKUnit(fromString: "kg"), doubleValue: massNumber)
    let metadata = [ HKMetadataKeyWasUserEntered : true ]
    let sample = HKQuantitySample(type: weightType, quantity: weightValue,
        startDate: datePicker.date, endDate: datePicker.date, metadata: metadata)

    init() {
        let weightType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        println("\(weightType.)")
    }
   
}
