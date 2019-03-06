//
//  CherryEntity+CoreDataProperties.swift
//  HW16CherryTodolist
//
//  Created by min-chia on 2019/3/5.
//  Copyright © 2019 min-chia. All rights reserved.
//
//

import Foundation
import CoreData


extension CherryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CherryEntity> {
        return NSFetchRequest<CherryEntity>(entityName: "CherryEntity")
    }

    @NSManaged public var address: String?
    @NSManaged public var check: Int32
    @NSManaged public var name: String?

}
