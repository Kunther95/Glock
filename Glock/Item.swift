//
//  Item.swift
//  Glock
//
//  Created by Fabio Attianese on 14/11/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Item {
    //var id: Int
    //var toggle : Bool = false
    var time : Date
    
    var ischecked : Bool  = false
    
    init(time: Date, ischecked: Bool = false) {
        self.time = time
        self.ischecked = ischecked
    }
    
    
    
    }
   

