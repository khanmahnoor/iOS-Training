//
//  User.swift
//  Codable
//
//  Created by Mahnoor Khan on 11/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int?
    var name: String?
    var username : String?
    var email : String?
    var address : Address?
    var phone : String?
    var website : String?
    var company : Company?
}

struct Address : Codable {
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
    var geo : Geo?
}

struct Geo : Codable {
    var lat : String?
    var lng : String?
}

struct Company : Codable {
    var name : String?
    var catchPhrase : String?
    var bs : String?
}
