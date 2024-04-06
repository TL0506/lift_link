//
//  Message.swift
//  LiftLink
//
//  Created by Tiffany Lin on 4/5/24.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var received : Bool
    var timestamp: Date
    
}
