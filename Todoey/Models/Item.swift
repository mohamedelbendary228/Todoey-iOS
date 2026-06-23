//
//  Data.swift
//  Todoey
//
//  Created by Mohamed Elbendary on 23/06/2026.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
