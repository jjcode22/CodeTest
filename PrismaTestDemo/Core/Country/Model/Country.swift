//
//  Country.swift
//  PrimsaTestDemo
//
//  Created by JJMac on 25/07/24.
//

import Foundation

struct ApiResponse: Codable {
    let error: Bool
    let msg: String
    let data: [Country]
}

struct Country: Codable{
    let name: String
    let flag: String
}
