//
//  ChecklistItem.swift
//  Todoey
//
//  Created by Richard Maleho on 2019/06/25.
//  Copyright © 2019 Profecia IT. All rights reserved.
//

import Foundation


class ChecklistItem {
    
    var text = ""
    var checked = false
    
    init(text : String, checked : Bool) {
        self.text = text
        self.checked = checked
    }
    
}
