//
//  Category.swift
//  Todoey
//
//  Created by Mohamed Elbendary on 23/06/2026.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
    
}

