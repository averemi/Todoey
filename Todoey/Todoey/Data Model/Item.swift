//
//  Item.swift
//  Todoey
//
//  Created by Anastasia Veremiichyk on 7/27/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
