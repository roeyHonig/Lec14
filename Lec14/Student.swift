//
//  Student.swift
//  Lec14
//
//  Created by hackeru on 24 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import Foundation


// tel swift that this struct should be codable (which is an interface)
/*set custom names*/
struct Student: Codable {
    var firstname: String?
    var lastname: String?
    var email: String?
    // id must have
    var id: Int
    
    enum codingKeys: String, CodingKey {
        case firstname = "firstName"
        case lastname = "lastName"
        case email = "email"
        case id = "id"
    }
    
    
}

struct studentAPI: Codable {
    var rows: [Student]
}
