//
//  HealthStoreUser.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/6/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import Foundation
import HealthKit

@objc protocol HealthStoreUser {
    var healthStore: HKHealthStore? { get set }
}