//
//  EntryController.swift
//  DayX-Swift
//
//  Created by Caleb Hicks on 3/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class EntryController: NSObject {

    // properties
    
    var entries:[Entry] {
        get {
            return Stack.sharedInstance.managedObjectContext.executeFetchRequest(NSFetchRequest(entityName:"Entry"), error: nil) as Array
        }
    }
    
    // shared instance
    
    /* In Xcode 6.3 or later that includes Swift 1.2 or higher, you can just use the following for a sharedInstance
    static let sharedInstance = EntryController ()
    */
    
    // In Xcode 6.2 or earlier that includes versions of Swift earlier than 1.2, use the following for a sharedInstance
    
    class var sharedInstance: EntryController {
        struct Static {
            static let instance: EntryController = EntryController()
        }
        return Static.instance
    }
    
    func createEntryWithDetails(title:String, text:String, date:NSDate) {
        var entry = NSEntityDescription.insertNewObjectForEntityForName("Entry", inManagedObjectContext: Stack.sharedInstance.managedObjectContext) as Entry
        
        entry.title = title
        entry.text = text
        entry.timestamp = date
        
        self.save()
    }
    
    // methods
    
    func removeEntry(entry:Entry) {
        entry.managedObjectContext!.deleteObject(entry)
        self.save()
    }
    
    func save () {
        Stack.sharedInstance.managedObjectContext.save(nil)
    }

}
