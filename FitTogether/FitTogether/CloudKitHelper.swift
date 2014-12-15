//
//  CloudKitHelper.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/3/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class CloudKitHelper {
   
    let container : CKContainer
    let publicDB : CKDatabase
    let privateDB : CKDatabase
    let handle : NSString?
    var error: Bool = false
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    func checkForICloud() -> Bool {
        if let token = NSFileManager.defaultManager().ubiquityIdentityToken {
            return true
        } else {
            return false
        }
    }
    
    func getUserName(completionHandler: (String -> Void)) {
        container.fetchUserRecordIDWithCompletionHandler({ (recordId, error) in
            self.container.requestApplicationPermission(CKApplicationPermissions.PermissionUserDiscoverability, completionHandler: { (status, error2) in
                if status == CKApplicationPermissionStatus.Granted {
                    self.container.discoverUserInfoWithUserRecordID(recordId, completionHandler: { (info, error3) in
                         completionHandler("\(info.firstName) \(info.lastName)")
                    })
                }
            })
        })
    }
    
    func saveRecord(record : NSString, tableName : NSString, forKey : NSString, isPrivate: Bool) {
        let todoRecord = CKRecord(recordType: tableName)
        todoRecord.setValue(record, forKey: forKey)
        if isPrivate {
            privateDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                } else {
                    NSLog("Saved to cloud kit \(record)")
                }
            })
        } else {
            publicDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                } else {
                    NSLog("Saved to cloud kit \(record)")
                }
            })
        }
    }
    
    func saveRecord(record : NSString, tableName : NSString, forKey : NSString, isPrivate: Bool, completionHandler: (CKRecord, NSError) -> Void) {
        let todoRecord = CKRecord(recordType: tableName)
        todoRecord.setValue(record, forKey: forKey)
        if isPrivate {
            privateDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                } else {
                    NSLog("Saved to cloud kit \(record)")
                    completionHandler(record, error)
                }
            })
        } else {
            publicDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                } else {
                    NSLog("Saved to cloud kit \(record)")
                    completionHandler(record, error)
                }
            })
        }
    }

    func saveRecord(record : NSString, tableName : NSString, forKey : NSString, recordId: NSString, isPrivate: Bool, completionHandler: (CKRecord) -> Void) {
        let ckRecordId = CKRecordID(recordName: recordId)
        let todoRecord = CKRecord(recordType: tableName, recordID: ckRecordId)
        todoRecord.setValue(record, forKey: forKey)
        if isPrivate {
            privateDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                    completionHandler(CKRecord(recordType: "Error"))
                } else {
                    NSLog("Saved to cloud kit \(record)")
                    if let testRecord = record {
                        completionHandler(testRecord)
                    } else {
                        println("Error Saving Record")
                        completionHandler(CKRecord(recordType: "Error"))
                    }
                }
            })
        } else {
            publicDB.saveRecord(todoRecord, completionHandler: { (record, error) -> Void in
                if error != nil {
                    println("There was an error \(error.description)!")
                    completionHandler(CKRecord(recordType: "Error"))
                } else {
                    NSLog("Saved to cloud kit \(record)")
                    if let testRecord = record {
                        completionHandler(testRecord)
                    } else {
                        println("Error Saving Record")
                        completionHandler(CKRecord(recordType: "Error"))
                    }
                }
            })
        }
    }
    
    func modifyRecord(record : NSString, tableName : NSString, forKey : NSString, recordId: NSString, isPrivate: Bool) {
        let ckRecordId = CKRecordID(recordName: recordId)
        let todoRecord = CKRecord(recordType: tableName, recordID: ckRecordId)
        let operation = CKModifyRecordsOperation(recordsToSave: [todoRecord], recordIDsToDelete: nil)
        publicDB.addOperation(operation)
    }
    
    func retriveRecords(sortKey: NSString, queryRecordType: NSString, completionHandler: ([AnyObject] -> Void)) -> AnyObject {
        let predicate = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: sortKey, ascending: false)
        var queryRecord : AnyObject?
        var queryError : AnyObject?
        
        let query = CKQuery(recordType: queryRecordType, predicate: predicate)
        query.sortDescriptors = [sort]
    
        publicDB.performQuery(query, inZoneWithID: nil, completionHandler: { (records: [AnyObject]!, error: NSError!) -> Void in
            if error != nil {
                NSLog("Error \(error)")
                queryError = error
                self.error = true
                return
            } else {
                completionHandler(records)
                return
            }
        })
    
        
        if queryRecord != nil {
            self.error = false
            return queryRecord!
        }
        if queryError != nil {
            self.error = true
            return queryError!
        }
        return "Error"
    }
   
    func retriveRecords(recordId: NSString, completionHandler: (CKRecord -> Void)) {
        let ckRecordId = CKRecordID(recordName: recordId)
        
        publicDB.fetchRecordWithID(ckRecordId, completionHandler: { (record, error) -> Void in
            if error != nil {
                completionHandler(CKRecord(recordType: "Error"))
                println(error)
            } else {
                completionHandler(record)
            }
        })
    }
}
