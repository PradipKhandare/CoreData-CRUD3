//
//  Student+CoreDataProperties.swift
//  CoreData3-Save
//
//  Created by NTS on 16/01/24.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var rollNumber: String?
    @NSManaged public var mobile: String?
    @NSManaged public var dob: String?
    @NSManaged public var address: String?

}

extension Student : Identifiable {

}
