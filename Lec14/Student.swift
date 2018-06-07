//
//  Student.swift
//  Lec14
//
//  Created by hackeru on 24 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import Foundation


// tel swift that this struct should be codable (which is an interface)
struct Student: Codable {
    var firstname: String
    var lastname: String
    var email: String
    // id must have
    var id: Int
    
}

struct studentAPI: Codable {
    var rows: [Student]
}
