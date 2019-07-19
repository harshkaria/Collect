//
//  ReceiptItems+CoreDataProperties.swift
//  Collect
//
//  Created by Rizzian Tuazon on 7/18/19.
//  Copyright © 2019 The Collective. All rights reserved.
//
//

import Foundation
import CoreData


extension ReceiptItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReceiptItems> {
        return NSFetchRequest<ReceiptItems>(entityName: "ReceiptItems")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var itemPrice: Double
    @NSManaged public var itemReceipt: Receipt?
    @NSManaged public var itemToPerson: NSSet?

}

// MARK: Generated accessors for itemToPerson
extension ReceiptItems {

    @objc(addItemToPersonObject:)
    @NSManaged public func addToItemToPerson(_ value: PeopleList)

    @objc(removeItemToPersonObject:)
    @NSManaged public func removeFromItemToPerson(_ value: PeopleList)

    @objc(addItemToPerson:)
    @NSManaged public func addToItemToPerson(_ values: NSSet)

    @objc(removeItemToPerson:)
    @NSManaged public func removeFromItemToPerson(_ values: NSSet)

}
