//
//  Entry.swift
//  DayX-Swift
//
//  Created by Caleb Hicks on 3/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

import Foundation
import CoreData

@objc(Entry)
class Entry: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var text: String
    @NSManaged var timestamp: NSDate

}
