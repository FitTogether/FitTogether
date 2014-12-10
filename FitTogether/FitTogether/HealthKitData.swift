//
//  HealthKitData.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/10/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import Foundation
import HealthKit
import UIkit

class HealthKitData {
    
    var dailySteps = [HKQuantitySample]()
    var healthStore = HKHealthStore()
    
    init() {
        requestAuthorisationForHealthStore()
        println("Hey \(self.dailySteps)")
    }
    
    private func requestAuthorisationForHealthStore() {
        let dataTypesToWrite = [
            HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
        ]
        let dataTypesToRead = [HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)]
        
        self.healthStore.requestAuthorizationToShareTypes(NSSet(array: dataTypesToWrite),
            readTypes: NSSet(array: dataTypesToRead), completion: {
                (success, error) in
                if success {
                    println("User completed authorisation request.")
                } else {
                    UIAlertView(title: "Hey Brah", message: "You must allow me to see your data, nothing will go wrong....", delegate: nil, cancelButtonTitle: "My Mistake")
                }
        })
    }
    
    func queryHealthKitSteps() {
        let endDate = NSDate()
        let startDate = NSCalendar.currentCalendar().dateByAddingUnit(.CalendarUnitMonth,
            value: -1, toDate: endDate, options: nil)
        
        let weightSampleType = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
        let predicate = HKQuery.predicateForSamplesWithStartDate(startDate,
            endDate: endDate, options: .None)
        
        let query = HKSampleQuery(sampleType: weightSampleType, predicate: predicate,
            limit: 0, sortDescriptors: nil, resultsHandler: {
                (query, results, error) in
                if !(results != nil) {
                    println("There was an error running the query: \(error)")
                }
                dispatch_async(dispatch_get_main_queue()) {
                    self.dailySteps = results as [HKQuantitySample]
                    println("Hey \(self.dailySteps)")
                }
        })
        healthStore.executeQuery(query)
    }
    
}