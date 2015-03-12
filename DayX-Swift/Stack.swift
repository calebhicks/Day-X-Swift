//
//  Stack.swift
//  DayX-Swift
//
//  Created by Caleb Hicks on 3/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class Stack: NSObject {
    
    var managedObjectContext : NSManagedObjectContext!
    
    override init() {
        super.init()
        
        self.setupManagedObjectContext()
    }

    func setupManagedObjectContext () {
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        self.managedObjectContext!.persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel())
        
        var error = NSErrorPointer()
        
        self.managedObjectContext!.persistentStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: self.storeURL(), options: nil, error: error)
    }
    
    func storeURL () -> NSURL? {
        let documentsDirectory = NSFileManager.defaultManager().URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true, error: nil)
        
        return documentsDirectory?.URLByAppendingPathComponent("db.sqlite")
    }
    
    func modelURL () -> NSURL {
        return NSBundle.mainBundle().URLForResource("Model", withExtension: "momd")!
    }
    
    func managedObjectModel () -> NSManagedObjectModel {
        return NSManagedObjectModel(contentsOfURL: self.modelURL())!
    }
    
    // shared instance
    
    /* In Xcode 6.3 or later that includes Swift 1.2 or higher, you can just use the following for a sharedInstance
    static let sharedInstance = EntryController ()
    */
    
    // In Xcode 6.2 or earlier that includes versions of Swift earlier than 1.2, use the following for a sharedInstance
    
    class var sharedInstance: Stack {
        struct Static {
            static let instance: Stack = Stack()
        }
        return Static.instance
    }
   
}
