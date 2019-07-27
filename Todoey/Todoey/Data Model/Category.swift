//
//  Category.swift
//  Todoey
//
//  Created by Anastasia Veremiichyk on 7/27/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
