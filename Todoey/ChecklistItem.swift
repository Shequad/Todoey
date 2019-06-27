//
//  ChecklistItem.swift
//  Todoey
//
//  Created by Richard Maleho on 2019/06/25.
//  Copyright © 2019 Profecia IT. All rights reserved.
//

import Foundation


class ChecklistItem : Encodable, Decodable {
    
    var text : String = ""
    var checked : Bool = false
    
    init(text : String, checked : Bool) {
        self.text = text
        self.checked = checked
    }
    
}
